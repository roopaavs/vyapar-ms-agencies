# Vyapar Clone - Flutter Accounting App

A comprehensive Flutter-based accounting and billing application inspired by Vyapar app.

## Features

### 📊 Dashboard
- Business overview with key metrics
- Quick stats (Sales, Purchases, Profit/Loss)
- Recent transactions
- Interactive charts and graphs

### 🧾 Invoice Management
- Create and manage invoices
- Customer management
- Multiple payment methods
- GST calculations
- PDF generation and sharing

### 📦 Inventory Management
- Product catalog
- Stock tracking
- Low stock alerts
- Category management
- Barcode scanning support

### 💰 Expense Tracking
- Record business expenses
- Category-wise organization
- Vendor management
- Receipt attachments

### 📈 Reports & Analytics
- Sales reports
- Profit/Loss statements
- GST reports
- Customer reports
- Visual charts and graphs

### ⚙️ Settings
- Business profile setup
- Tax configurations
- Backup & restore
- User preferences

## Tech Stack

- **Framework**: Flutter 3.x
- **State Management**: Provider
- **Local Database**: SQLite (sqflite)
- **Charts**: FL Chart
- **UI Design**: Material Design 3
- **Platform**: Android & iOS

## Quick Start

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/vyapar-clone-flutter.git
   cd vyapar-clone-flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Online Development

You can also run this project online without local installation:

#### Using Project IDX (Recommended)
1. Go to [idx.dev](https://idx.dev)
2. Sign in with Google account
3. Import from GitHub: `your-username/vyapar-clone-flutter`
4. Select Flutter template
5. Run with web preview

#### Using FlutLab
1. Go to [flutlab.io](https://flutlab.io)
2. Create new project
3. Upload project files
4. Build and run online

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── invoice.dart
│   ├── product.dart
│   ├── expense.dart
│   └── customer.dart
├── screens/
│   ├── dashboard_screen.dart
│   ├── invoice_list_screen.dart
│   ├── create_invoice_screen.dart
│   ├── inventory_screen.dart
│   ├── expense_screen.dart
│   ├── reports_screen.dart
│   └── settings_screen.dart
├── providers/
│   ├── invoice_provider.dart
│   ├── inventory_provider.dart
│   ├── expense_provider.dart
│   └── dashboard_provider.dart
├── services/
│   └── database_service.dart
└── widgets/
    ├── dashboard_card.dart
    ├── invoice_tile.dart
    └── common_widgets.dart
```

## Features Implementation Status

- ✅ Dashboard with analytics
- ✅ Invoice creation and management
- ✅ Customer management
- ✅ Product/Inventory management
- ✅ Expense tracking
- ✅ Reports and charts
- ✅ Settings and configuration
- ✅ Local SQLite database
- ✅ Material Design 3 UI
- ⏳ PDF generation (planned)
- ⏳ Cloud sync (planned)
- ⏳ Barcode scanning (planned)

## Screenshots

*Screenshots will be added after testing the app*

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by Vyapar App's excellent UI/UX design
- Flutter community for amazing packages
- Material Design 3 guidelines

## Support

If you find this project helpful, please give it a ⭐ on GitHub!

---

**Author**: MiniMax Agent  
**Created**: 2025  
**Flutter Version**: 3.x+