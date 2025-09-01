import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_provider.dart';
import '../constants/app_constants.dart';

/// Helper class to access theme-aware colors and styles
class ThemeHelper {
  static ThemeProvider? _themeProvider;
  static Brightness? _systemBrightness;

  /// Initialize the theme helper with the theme provider
  static void initialize(ThemeProvider themeProvider) {
    _themeProvider = themeProvider;
  }

  /// Update the system brightness
  static void updateSystemBrightness(Brightness brightness) {
    _systemBrightness = brightness;
  }

  /// Get the current theme provider
  static ThemeProvider? get themeProvider => _themeProvider;

  /// Check if dark mode is currently active
  static bool get isDarkMode {
    if (_themeProvider == null || _systemBrightness == null) return true; // Default to dark theme
    return _themeProvider!.shouldUseDarkMode(_systemBrightness!);
  }

  /// Check if light mode is currently active
  static bool get isLightMode => !isDarkMode;

  /// Get the current effective theme
  static String get currentTheme {
    if (_themeProvider == null || _systemBrightness == null) {
      return AppConstants.darkTheme; // Default to dark theme
    }
    return _themeProvider!.getEffectiveTheme(_systemBrightness!);
  }

  // Color getters
  static Color get primary => isDarkMode ? DarkColors.primary : LightColors.primary;
  static Color get background => isDarkMode ? DarkColors.background : LightColors.background;
  static Color get surface => isDarkMode ? DarkColors.surface : LightColors.surface;
  static Color get surfaceVariant => isDarkMode ? DarkColors.surfaceVariant : LightColors.surfaceVariant;
  static Color get secondaryCardBackground => isDarkMode ? DarkColors.secondaryCardBackground : LightColors.secondaryCardBackground;
  static Color get cardBackground => isDarkMode ? DarkColors.cardBackground : LightColors.cardBackground;
  
  static Color get textPrimary => isDarkMode ? DarkColors.textPrimary : LightColors.textPrimary;
  static Color get textSecondary => isDarkMode ? DarkColors.textSecondary : LightColors.textSecondary;
  static Color get textDisabled => isDarkMode ? DarkColors.textDisabled : LightColors.textDisabled;
  static Color get textInverse => isDarkMode ? DarkColors.textInverse : LightColors.textInverse;
  
  static Color get border => isDarkMode ? DarkColors.border : LightColors.border;
  static Color get divider => isDarkMode ? DarkColors.divider : LightColors.divider;
  
  static Color get navBackground => isDarkMode ? DarkColors.navBackground : LightColors.navBackground;
  static Color get navActive => isDarkMode ? DarkColors.white : LightColors.black;
  static Color get navInactive => isDarkMode ? DarkColors.navInactive : LightColors.navInactive.withOpacity(0.85);
  
  static Color get overlay => isDarkMode ? DarkColors.overlay : LightColors.overlay;
  static Color get shadow => isDarkMode ? DarkColors.shadow : LightColors.shadow;
  
  static Color get success => isDarkMode ? DarkColors.success : LightColors.success;
  static Color get error => isDarkMode ? DarkColors.error : LightColors.error;
  static Color get warning => isDarkMode ? DarkColors.warning : LightColors.warning;
  static Color get info => isDarkMode ? DarkColors.info : LightColors.info;

  // Text style getters
  static TextStyle get heading1 => isDarkMode ? DarkTextStyles.heading1 : LightTextStyles.heading1;
  static TextStyle get heading2 => isDarkMode ? DarkTextStyles.heading2 : LightTextStyles.heading2;
  static TextStyle get heading3 => isDarkMode ? DarkTextStyles.heading3 : LightTextStyles.heading3;
  static TextStyle get body1 => isDarkMode ? DarkTextStyles.body1 : LightTextStyles.body1;
  static TextStyle get body2 => isDarkMode ? DarkTextStyles.body2 : LightTextStyles.body2;
  static TextStyle get caption => isDarkMode ? DarkTextStyles.caption : LightTextStyles.caption;
  static TextStyle get button => isDarkMode ? DarkTextStyles.button : LightTextStyles.button;

  // Theme data getters
  static CupertinoThemeData get cupertinoTheme => 
      isDarkMode ? DarkTheme.cupertinoTheme : LightTheme.cupertinoTheme;

  /// Get a color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Get primary color with opacity
  static Color primaryWithOpacity(double opacity) {
    return primary.withOpacity(opacity);
  }

  /// Get surface color with opacity
  static Color surfaceWithOpacity(double opacity) {
    return surface.withOpacity(opacity);
  }

  /// Get text color with opacity
  static Color textWithOpacity(double opacity) {
    return textPrimary.withOpacity(opacity);
  }

  /// Get a text style with custom color
  static TextStyle textStyleWithColor(TextStyle baseStyle, Color color) {
    return baseStyle.copyWith(color: color);
  }

  /// Get a text style with custom size
  static TextStyle textStyleWithSize(TextStyle baseStyle, double size) {
    return baseStyle.copyWith(fontSize: size);
  }

  /// Get a text style with custom weight
  static TextStyle textStyleWithWeight(TextStyle baseStyle, FontWeight weight) {
    return baseStyle.copyWith(fontWeight: weight);
  }

  /// Get a text style with custom color and size
  static TextStyle textStyleWithColorAndSize(TextStyle baseStyle, Color color, double size) {
    return baseStyle.copyWith(color: color, fontSize: size);
  }

  /// Get a text style with custom color, size, and weight
  static TextStyle textStyleWithColorSizeAndWeight(
    TextStyle baseStyle, 
    Color color, 
    double size, 
    FontWeight weight
  ) {
    return baseStyle.copyWith(color: color, fontSize: size, fontWeight: weight);
  }

  /// Get a box decoration for cards
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: cardBackground,
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    border: Border.all(color: border, width: 1),
    boxShadow: [
      BoxShadow(
        color: shadow,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  /// Get a box decoration for elevated cards
  static BoxDecoration get elevatedCardDecoration => BoxDecoration(
    color: cardBackground,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: shadow,
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );

  /// Get a box decoration for input fields
  static BoxDecoration get inputDecoration => BoxDecoration(
    color: surface,
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    border: Border.all(color: border, width: 1),
  );

  /// Get a box decoration for buttons
  static BoxDecoration get buttonDecoration => BoxDecoration(
    color: primary,
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  );

  /// Get a box decoration for secondary buttons
  static BoxDecoration get secondaryButtonDecoration => BoxDecoration(
    color: surface,
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    border: Border.all(color: border, width: 1),
  );

  /// Get a box decoration for icon containers
  static BoxDecoration get iconContainerDecoration => BoxDecoration(
    color: primaryWithOpacity(0.1),
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  );

  /// Get a box decoration for error icon containers
  static BoxDecoration get errorIconContainerDecoration => BoxDecoration(
    color: error.withOpacity(0.1),
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  );
} 