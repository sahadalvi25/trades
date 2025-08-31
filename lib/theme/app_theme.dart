import 'package:flutter/cupertino.dart';

class AppTheme {
  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSecondaryBackground = Color(0xFF1C1C1E);
  static const Color darkTertiaryBackground = Color(0xFF2C2C2E);
  static const Color darkPrimary = Color(0xFFFFFFFF);
  static const Color darkSecondary = Color(0xFF8E8E93);
  static const Color darkAccent = Color(0xFF007AFF);
  
  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSecondaryBackground = Color(0xFFF2F2F7);
  static const Color lightTertiaryBackground = Color(0xFFE5E5EA);
  static const Color lightPrimary = Color(0xFF000000);
  static const Color lightSecondary = Color(0xFF8E8E93);
  static const Color lightAccent = Color(0xFF007AFF);
  
  // Common Colors
  static const Color green = Color(0xFF30D158);
  static const Color red = Color(0xFFFF3B30);
  static const Color orange = Color(0xFFFF9500);
  static const Color premiumGradientStart = Color(0xFFD4A574);
  static const Color premiumGradientEnd = Color(0xFFB8956A);

  static CupertinoThemeData get darkTheme {
    return const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: darkAccent,
      scaffoldBackgroundColor: darkBackground,
      barBackgroundColor: darkSecondaryBackground,
      textTheme: CupertinoTextThemeData(
        primaryColor: darkPrimary,
        textStyle: TextStyle(
          color: darkPrimary,
        ),
      ),
    );
  }

  static CupertinoThemeData get lightTheme {
    return const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: lightAccent,
      scaffoldBackgroundColor: lightBackground,
      barBackgroundColor: lightSecondaryBackground,
      textTheme: CupertinoTextThemeData(
        primaryColor: lightPrimary,
        textStyle: TextStyle(
          color: lightPrimary,
        ),
      ),
    );
  }
}
