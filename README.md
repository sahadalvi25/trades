# Trades - Flutter Trading App

A beautiful Flutter app for traders to find and analyze stock market data, built with Cupertino design principles.

## Features

- **Pure Cupertino Design**: No Material widgets, fully iOS-native feel
- **Dark/Light Theme Support**: Easy theme switching with comprehensive style guide
- **Bottom Navigation**: 5-tab structure (Home, Portfolios, News, My Assets, Profile)
- **Home Screen Components**:
  - Premium banner with gradient design
  - Watchlist with stock cards
  - Stock discovery with tabbed interface
  - Interactive charts using fl_chart
  - Search functionality with Dow Jones indicator

## Architecture

### Theme System
- `AppTheme`: Central theme configuration for dark/light modes
- `AppTextStyles`: Comprehensive text style guide following SF Pro Display
- Easy theme switching throughout the app

### Screens
- `MainTabView`: Bottom tab navigation controller
- `HomeScreen`: Main dashboard with watchlist and discovery
- Placeholder screens for other tabs (ready for expansion)

### Widgets
- `PremiumBanner`: Gradient banner with decorative patterns
- `StockCard`: Watchlist stock cards with charts
- `StockListItem`: List items for stock discovery
- `SearchBarWidget`: Bottom search with market indicators

## Getting Started

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the App**:
   ```bash
   flutter run
   ```

## Dependencies

- `cupertino_icons`: ^1.0.6 - iOS-style icons
- `fl_chart`: ^0.68.0 - Beautiful charts for stock data

## Theme Switching

The app supports easy theme switching:
- Toggle available in Profile screen
- Themes persist throughout the app
- All components respect the current theme

## Next Steps

The app is structured to easily add:
- Real stock data integration
- Advanced charting features
- Portfolio management
- News feed
- Asset tracking
- User authentication

## Design Notes

- Follows iOS Human Interface Guidelines
- Uses SF Pro Display font family
- Implements proper color contrast for accessibility
- Responsive design for different screen sizes