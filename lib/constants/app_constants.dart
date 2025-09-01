import 'package:flutter/cupertino.dart';

/// App-wide constants and configurations

abstract class EntitleMents {
  static const String entitlementId = "Trades Subscriptions";

  static const String footerText = "Example Footer Text for Trades";

  static const String appleApiKey = "appl_gEOHPqvomPMZBLZBbfEMPozGRqQ"; //  TODO: Replace with actual Apple API key from RevenueCat

  static const String googleApiKey = "goog_dLFaEfDIJhHydFTLDTtJUeyPekb"; //  TODO: Replace with actual Google API key from RevenueCat
}

class GoogleMapsApiKey {
  static const String googleMapsApiKey = 'AIzaSyCfrP47NXQBMPlR3Af---w3pLA9Qk6tsGc';
}
  
class FontFamily {
   //static const String heading = 'UberMove';
  static const String heading = 'Ivy-Presto-Text';
  //static const String heading = 'TestTiemposFine';
  static const String body = 'SF-Pro';
}

class AppConstants {
  // App Information
  static String authToken = '';
  static String userId = '';
  static String name = '';
  static String email = '';
  static String username = '';
  static bool isSubscriptionActive = false;
  static String currentSubscription = '';
  static String revenueCatId = '';
  // One-time trigger to auto-generate itinerary after successful subscription flow
  static bool autoGenerateItineraryOnce = false;
  static const String appName = 'Trades';
  static const String appVersion = '1.0.0';

  // Cache Constants
  static const int cacheDuration = 7; // days
  static const String cacheKey = 'trades_cache';

  // Theme Constants
  static const String themeKey = 'app_theme';
  static const String lightTheme = 'light';
  static const String darkTheme = 'dark';
  static const String systemTheme = 'system';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 350);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Layout Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double borderRadiusCircle = 100.0;
  static const double iconSize = 24.0;
  static const double bottomNavHeight = 49.0;

  // Spacing
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  
  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  
  // Font Sizes
  static const double fontSizeXS = 12.0;
  static const double fontSizeS = 14.0;
  static const double fontSizeM = 16.0;
  static const double fontSizeL = 18.0;
  static const double fontSizeXL = 20.0;
  static const double fontSizeXXL = 24.0;
  static const double fontSizeXXXL = 32.0;

  // Error Messages
  static const String genericError = 'Something went wrong. Please try again.';
  static const String networkError = 'Please check your internet connection.';
  static const String timeoutError = 'Request timed out. Please try again.';
}

/// Light theme color palette
class LightColors {
  // Brand Colors
  static const Color primary = Color(0xFF0BA5EC);
  static const Color background = Color(0xFFFFFFFF);

  // Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Black Shades
  static const Color black90 = Color(0xFF1A1A1A);
  static const Color black80 = Color(0xFF333333);
  static const Color black70 = Color(0xFF4D4D4D);
  static const Color black60 = Color(0xFF666666);
  static const Color black50 = Color(0xFF808080);
  static const Color black40 = Color(0xFF999999);
  static const Color black30 = Color(0xFFB3B3B3);
  static const Color black20 = Color(0xFFCCCCCC);
  static const Color black10 = Color(0xFFE6E6E6);

  // Semantic Colors
  static const Color success = Color(0xFF0BA5EC);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFF0BA5EC);
  static const Color info = Color(0xFF0BA5EC);

  // Background Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textInverse = Color(0xFFFFFFFF);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // Navigation
  static const Color navBackground = Color(0xFFFFFFFF);
  static const Color navActive = Color(0xFF0BA5EC);
  static const Color navInactive = Color(0xFF808080);

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color shadow = Color(0x1A000000);
}

/// Dark theme color palette
class DarkColors {
  // Brand Colors
  static const Color primary = Color(0xFF2E90FA);
  static const Color background = Color.fromARGB(255, 0, 0, 0);

  // Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // White Shades
  static const Color white90 = Color(0xFFE6E6E6);
  static const Color white80 = Color(0xFFCCCCCC);
  static const Color white70 = Color(0xFFB3B3B3);
  static const Color white60 = Color(0xFF999999);
  static const Color white50 = Color(0xFF808080);
  static const Color white40 = Color(0xFF666666);
  static const Color white30 = Color(0xFF4D4D4D);
  static const Color white20 = Color(0xFF333333);
  static const Color white10 = Color(0xFF1A1A1A);

  // Semantic Colors
  static const Color success =Color(0xFF82F6BD);
  static const Color error = Color(0xFFE53935);   // Already good - a strong red
  static const Color warning = Color(0xFFF9A825); // Amber-ish yellow
  static const Color info = Color(0xFF2E90FA);    // A nice blue for informational

  // Background Colors     // Deep near-black
  static const Color surface = Color(0xFF121820);          // Dark blue-black
  static const Color surfaceVariant = Color(0xFF18191D);   // Slightly lighter for cards
  static const Color cardBackground = Color(0xFF181E27);   // Consistent with surfaceVariant

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textDisabled = Color(0xFF666666);
  static const Color textInverse = Color(0xFF000000);

  // Border Colors
  static const Color border = Color(0xFF404040);
  static const Color divider = Color(0xFF2D2D2D);

  // Navigation
  static const Color navBackground = Color(0xFF1E1E1E);
  static const Color navActive = Color(0xFF0BA5EC);
  static const Color navInactive = Color(0xFF808080);

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color shadow = Color(0x40000000);
}

/// Legacy AppColors class for backward compatibility
class AppColors {
  // Brand Colors - Blue accent only
  static const Color primary = Color(0xFF0BA5EC); // Blue accent
  static const Color background = Color(0xFFFFFFFF); // White background

  // Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Black Shades
  static const Color black90 = Color(0xFF1A1A1A);
  static const Color black80 = Color(0xFF333333);
  static const Color black70 = Color(0xFF4D4D4D);
  static const Color black60 = Color(0xFF666666);
  static const Color black50 = Color(0xFF808080);
  static const Color black40 = Color(0xFF999999);
  static const Color black30 = Color(0xFFB3B3B3);
  static const Color black20 = Color(0xFFCCCCCC);
  static const Color black10 = Color(0xFFE6E6E6);

  // Semantic Colors - Using blue for all
  static const Color success = Color(0xFF0BA5EC);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFF0BA5EC);
  static const Color info = Color(0xFF0BA5EC);

  // Background Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // Navigation
  static const Color navBackground = Color(0xFFFFFFFF); // White background
  static const Color navActive = Color(0xFF0BA5EC); // Blue accent
  static const Color navInactive = Color(0xFF808080); // Gray for inactive
}

/// Light theme text styles
class LightTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: LightColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: LightColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: LightColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    letterSpacing: -0.2,
    height: 1.5,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: LightColors.textPrimary,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: LightColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: LightColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w300,
    color: LightColors.surface,
  );
}

/// Dark theme text styles
class DarkTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    letterSpacing: 0.25,
    height: 1.32,
    color: DarkColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: DarkColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: DarkColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: DarkColors.textPrimary,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: DarkColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: DarkColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w300,
    color: DarkColors.surface,
  );
}



/// Legacy AppTextStyles class for backward compatibility
class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    letterSpacing: 0.25,
    height: 1.32,
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimary,
    fontFamily: FontFamily.heading,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    letterSpacing: -0.2,
    fontFamily: FontFamily.body,
    fontWeight: FontWeight.w300,
    color: AppColors.surface,
  );
}

/// Theme data for light mode
class LightTheme {
  static CupertinoThemeData get cupertinoTheme {
    return const CupertinoThemeData(
      primaryColor: LightColors.textPrimary,
      scaffoldBackgroundColor: LightColors.background,
      barBackgroundColor: LightColors.background,
      primaryContrastingColor: LightColors.white,
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        primaryColor: LightColors.textPrimary,
        textStyle: TextStyle(
          color: LightColors.textPrimary,
          fontFamily: FontFamily.body,
        ),
        actionTextStyle: TextStyle(
          color: LightColors.primary,
          fontFamily: FontFamily.body,
        ),
        tabLabelTextStyle: TextStyle(
          color: LightColors.textSecondary,
          fontFamily: FontFamily.body,
        ),
        navTitleTextStyle: TextStyle(
          color: LightColors.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w300,
          fontFamily: FontFamily.body,
        ),
        navLargeTitleTextStyle: TextStyle(
          color: LightColors.textPrimary,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.body,
        ),
        pickerTextStyle: TextStyle(
          color: LightColors.textPrimary,
          fontFamily: FontFamily.body,
        ),
        dateTimePickerTextStyle: TextStyle(
          color: LightColors.textPrimary,
          fontFamily: FontFamily.body,
        ),
      ),
    );
  }
}

/// Theme data for dark mode
class DarkTheme {
  static CupertinoThemeData get cupertinoTheme {
    return const CupertinoThemeData(
      primaryColor: DarkColors.primary,
      scaffoldBackgroundColor: DarkColors.background,
      barBackgroundColor: DarkColors.background,
      primaryContrastingColor: DarkColors.white,
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(
        primaryColor: DarkColors.primary,
        textStyle: TextStyle(
          fontFamily: FontFamily.body,
          color: DarkColors.textPrimary,
        ),
        actionTextStyle: TextStyle(
          fontFamily: FontFamily.body,
          color: DarkColors.primary,
        ),
        tabLabelTextStyle: TextStyle(
          fontFamily: FontFamily.body,
          color: DarkColors.textSecondary,
        ),
        navTitleTextStyle: TextStyle(
          color: DarkColors.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w300,
          fontFamily: FontFamily.body,
        ),
        navLargeTitleTextStyle: TextStyle(
          color: DarkColors.textPrimary,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.body,
          ),
        pickerTextStyle: TextStyle(
          color: DarkColors.textPrimary,
          fontFamily: FontFamily.body,
        ),
        dateTimePickerTextStyle: TextStyle(
          color: DarkColors.textPrimary,
          fontFamily: FontFamily.body,
        ),
      ),
    );
  }
}

/// Animation durations and curves
class AppAnimations {
  static const Duration short = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 350);
  static const Duration long = Duration(milliseconds: 500);

  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve bounceCurve = Curves.bounceOut;
  static const Curve elasticCurve = Curves.elasticOut;
}

/// Responsive utilities for screen size adaptation
class AppResponsive {
  /// Returns horizontal padding based on device width
  static double horizontalPadding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 375) return 12.0;
    if (width > 430) return 28.0;
    return 20.0;
  }

  /// Returns vertical padding based on device height
  static double verticalPadding(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    if (height < 700) return 10.0;
    if (height > 900) return 28.0;
    return 18.0;
  }

  /// Returns a responsive font size based on device width and text scale
  static double fontSize(BuildContext context, double base) {
    double width = MediaQuery.of(context).size.width;
    double scale = MediaQuery.textScaleFactorOf(context);
    if (width < 375) return base * 0.92 * scale;
    if (width > 430) return base * 1.12 * scale;
    return base * scale;
  }

  /// Returns a responsive icon size
  static double iconSize(BuildContext context, {double base = 26.0}) {
    double width = MediaQuery.of(context).size.width;
    if (width < 375) return base * 0.85;
    if (width > 430) return base * 1.15;
    return base;
  }

  /// Returns a responsive card width (90% of screen width)
  static double cardWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.9;
  }

  /// Returns a responsive card height
  static double cardHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 375) return 120.0;
    if (width > 430) return 180.0;
    return 150.0;
  }

  /// Returns extra bottom padding for safe area (e.g., iPhone home indicator)
  static double safeBottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}
