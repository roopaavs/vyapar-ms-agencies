import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'vyapar_clone.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create invoices table
    await db.execute('''
      CREATE TABLE invoices(
        id TEXT PRIMARY KEY,
        invoiceNumber TEXT NOT NULL,
        customerName TEXT NOT NULL,
        customerPhone TEXT NOT NULL,
        customerEmail TEXT,
        date TEXT NOT NULL,
        dueDate TEXT NOT NULL,
        subtotal REAL NOT NULL,
        gstRate REAL NOT NULL,
        gstAmount REAL NOT NULL,
        total REAL NOT NULL,
        status TEXT NOT NULL,
        notes TEXT
      )
    ''');

    // Create invoice_items table
    await db.execute('''
      CREATE TABLE invoice_items(
        id TEXT PRIMARY KEY,
        invoiceId TEXT NOT NULL,
        productName TEXT NOT NULL,
        description TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        rate REAL NOT NULL,
        amount REAL NOT NULL,
        FOREIGN KEY (invoiceId) REFERENCES invoices (id)
      )
    ''');

    // Create products table
    await db.execute('''
      CREATE TABLE products(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        category TEXT NOT NULL,
        price REAL NOT NULL,
        stockQuantity INTEGER NOT NULL,
        minStockLevel INTEGER NOT NULL,
        unit TEXT NOT NULL,
        barcode TEXT,
        createdAt TEXT NOT NULL
      )
    ''');

    // Create expenses table
    await db.execute('''
      CREATE TABLE expenses(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        amount REAL NOT NULL,
        category TEXT NOT NULL,
        date TEXT NOT NULL,
        paymentMethod TEXT NOT NULL,
        receiptPath TEXT,
        isGstApplicable INTEGER NOT NULL,
        gstAmount REAL NOT NULL
      )
    ''');

    // Insert sample data
    await _insertSampleData(db);
  }

  Future<void> _insertSampleData(Database db) async {
    // Sample products
    await db.insert('products', {
      'id': 'prod_001',
      'name': 'Laptop HP Pavilion',
      'description': 'HP Pavilion 15-inch laptop with Intel i5 processor',
      'category': 'Electronics',
      'price': 45000.0,
      'stockQuantity': 10,
      'minStockLevel': 3,
      'unit': 'pcs',
      'barcode': null,
      'createdAt': DateTime.now().toIso8601String(),
    });

    await db.insert('products', {
      'id': 'prod_002',
      'name': 'Office Chair',
      'description': 'Ergonomic office chair with lumbar support',
      'category': 'Furniture',
      'price': 8500.0,
      'stockQuantity': 25,
      'minStockLevel': 5,
      'unit': 'pcs',
      'barcode': null,
      'createdAt': DateTime.now().toIso8601String(),
    });

    await db.insert('products', {
      'id': 'prod_003',
      'name': 'Wireless Mouse',
      'description': 'Logitech wireless optical mouse',
      'category': 'Electronics',
      'price': 1200.0,
      'stockQuantity': 50,
      'minStockLevel': 10,
      'unit': 'pcs',
      'barcode': null,
      'createdAt': DateTime.now().toIso8601String(),
    });

    // Sample expenses
    await db.insert('expenses', {
      'id': 'exp_001',
      'title': 'Office Rent',
      'description': 'Monthly office rent payment',
      'amount': 25000.0,
      'category': 'Rent',
      'date': DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
      'paymentMethod': 'bank_transfer',
      'receiptPath': null,
      'isGstApplicable': 1,
      'gstAmount': 4500.0,
    });

    await db.insert('expenses', {
      'id': 'exp_002',
      'title': 'Office Supplies',
      'description': 'Stationery and office materials',
      'amount': 3500.0,
      'category': 'Office Supplies',
      'date': DateTime.now().subtract(const Duration(days: 3)).toIso8601String(),
      'paymentMethod': 'cash',
      'receiptPath': null,
      'isGstApplicable': 1,
      'gstAmount': 630.0,
    });

    // Sample invoice
    final invoiceId = 'inv_001';
    await db.insert('invoices', {
      'id': invoiceId,
      'invoiceNumber': 'INV25001',
      'customerName': 'John Doe',
      'customerPhone': '+91 9876543210',
      'customerEmail': 'john.doe@email.com',
      'date': DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
      'dueDate': DateTime.now().add(const Duration(days: 28)).toIso8601String(),
      'subtotal': 46200.0,
      'gstRate': 18.0,
      'gstAmount': 8316.0,
      'total': 54516.0,
      'status': 'pending',
      'notes': 'Payment due in 30 days',
    });

    // Sample invoice items
    await db.insert('invoice_items', {
      'id': 'item_001',
      'invoiceId': invoiceId,
      'productName': 'Laptop HP Pavilion',
      'description': 'HP Pavilion 15-inch laptop',
      'quantity': 1,
      'rate': 45000.0,
      'amount': 45000.0,
    });

    await db.insert('invoice_items', {
      'id': 'item_002',
      'invoiceId': invoiceId,
      'productName': 'Wireless Mouse',
      'description': 'Logitech wireless mouse',
      'quantity': 1,
      'rate': 1200.0,
      'amount': 1200.0,
    });
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
