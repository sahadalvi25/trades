# Screens Directory Structure

This directory contains all the screen components of the app, organized in a clear and maintainable structure.

## Organization

Each screen has its own folder containing:
- **Main Screen File**: The primary screen component (e.g., `home_screen.dart`)
- **Widgets Folder**: Screen-specific widgets used only by that screen

## Structure

```
screens/
├── index.dart                           # Main export file for all screens
├── main_tab_view.dart                  # Main tab navigation container
├── home_screen/                        # Home Screen
│   ├── index.dart                      # Home screen exports
│   ├── home_screen.dart                # Main home screen component
│   └── widgets/                        # Home screen specific widgets
│       ├── premium_banner.dart
│       ├── watchlist_section.dart
│       ├── stock_discovery_section.dart
│       └── search_bar_widget.dart
├── portfolios_screen/                   # Portfolios Screen
│   ├── index.dart                      # Portfolios screen exports
│   ├── portfolios_screen.dart          # Main portfolios screen component
│   └── widgets/                        # Portfolios screen specific widgets
├── news_screen/                        # News Screen
│   ├── index.dart                      # News screen exports
│   ├── news_screen.dart                # Main news screen component
│   └── widgets/                        # News screen specific widgets
├── my_assets_screen/                   # My Assets Screen
│   ├── index.dart                      # My assets screen exports
│   ├── my_assets_screen.dart           # Main my assets screen component
│   └── widgets/                        # My assets screen specific widgets
└── profile_screen/                     # Profile Screen
    ├── index.dart                      # Profile screen exports
    ├── profile_screen.dart             # Main profile screen component
    └── widgets/                        # Profile screen specific widgets
```

## Common Widgets

General widgets that can be used across multiple screens are located in:
```
widgets/
└── common/                             # Shared/common widgets
    ├── index.dart                      # Common widgets exports
    ├── stock_card.dart                 # Reusable stock card widget
    └── stock_list_item.dart            # Reusable stock list item widget
```

## Usage

### Importing Screens
```dart
// Import individual screen
import 'screens/home_screen/home_screen.dart';

// Or import all screens via index
import 'screens/index.dart';
```

### Importing Widgets
```dart
// Import screen-specific widgets
import 'screens/home_screen/widgets/premium_banner.dart';

// Import common widgets
import 'widgets/common/stock_card.dart';
```

## Benefits

1. **Clear Organization**: Each screen has its own folder with related components
2. **Easy Navigation**: Developers can quickly find screen-specific code
3. **Maintainability**: Screen-specific widgets are co-located with their screens
4. **Reusability**: Common widgets are separated for reuse across screens
5. **Scalability**: Easy to add new screens and widgets following the same pattern
