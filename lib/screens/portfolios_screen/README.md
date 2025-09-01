# Portfolios Screen

The Portfolios Screen has been redesigned to match the provided design image with a modern, dark-themed interface.

## Features

### Header Section
- Large "Portfolios" title using the app's heading font (Ivy-Presto-Text)
- Three filter tabs: "All", "Favorites", and "Categories"
- Active tab highlighting with surface variant background
- Chevron icon for the Categories tab

### Portfolio Sections
The screen displays three main categories:

1. **US GOVERNMENT** - Government officials and politicians
2. **CELEBRITIES** - Public figures and entertainers  
3. **BUSINESS INSIDERS** - Corporate executives and business leaders

Each section includes:
- Section header with title and "View All" link
- Horizontally scrollable portfolio cards
- Consistent spacing and typography

### Portfolio Cards
Each portfolio card displays:
- Circular profile picture placeholder
- Name and title (e.g., "Reilge Bozzam", "US SENATOR")
- Favorite star button (filled for favorited, outline for not)
- 90-day PNL (Profit and Loss) with color coding
- Performance indicator (up/down arrow)
- ROI percentage with color coding
- Right chevron for navigation

## Components

### PortfolioCard Widget
- `lib/screens/portfolios_screen/widgets/portfolio_card.dart`
- Handles individual portfolio display with all financial metrics
- Supports favorite toggling and tap interactions
- Uses app's theme colors and decorations

### SectionHeader Widget  
- `lib/screens/portfolios_screen/widgets/section_header.dart`
- Displays section title and optional "View All" link
- Consistent styling with the app's design system

### PortfolioSection Widget
- `lib/screens/portfolios_screen/widgets/portfolio_section.dart`
- Combines header and horizontally scrollable cards
- Manages section layout and interactions

## Styling

The screen uses the app's existing theme system:
- **ThemeHelper** for colors and text styles
- **AppDecorations** for premium card styling with gradients
- **CupertinoPageScaffold** for iOS-style navigation
- Consistent spacing using the app's padding constants

## Data Structure

Portfolios are represented by the `PortfolioData` class:
```dart
class PortfolioData {
  final String name;
  final String title;
  final bool isFavorited;
  final double pnl;
  final double roi;
  final bool isPositive;
}
```

## Interactions

- **Filter Tabs**: Switch between All, Favorites, and Categories views
- **Portfolio Cards**: Tap to view portfolio details
- **Favorite Stars**: Toggle favorite status
- **View All Links**: Navigate to category-specific views

## Future Enhancements

- Real data integration with API calls
- Portfolio detail screen navigation
- Favorite filtering functionality
- Category-specific filtering
- Search functionality
- Performance charts and graphs
