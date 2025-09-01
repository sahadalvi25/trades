import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Theme provider that manages the app's theme state
class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'app_theme';
  
  String _currentTheme = AppConstants.lightTheme;
  bool _isInitialized = false;

  /// Get the current theme mode
  String get currentTheme => _currentTheme;
  
  /// Check if the provider has been initialized
  bool get isInitialized => _isInitialized;
  
  /// Check if dark mode is currently active
  bool get isDarkMode => _currentTheme == AppConstants.darkTheme;
  
  /// Check if light mode is currently active
  bool get isLightMode => _currentTheme == AppConstants.lightTheme;
  
  /// Check if system theme is being used
  bool get isSystemTheme => _currentTheme == AppConstants.systemTheme;

  /// Initialize the theme provider
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      _currentTheme = prefs.getString(_themeKey) ?? AppConstants.lightTheme;
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing theme provider: $e');
      _currentTheme = AppConstants.lightTheme;
      _isInitialized = true;
      notifyListeners();
    }
  }

  /// Set the theme mode
  Future<void> setTheme(String theme) async {
    if (_currentTheme == theme) return;
    
    _currentTheme = theme;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, theme);
      notifyListeners();
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
      notifyListeners();
    }
  }

  /// Toggle between light and dark themes
  Future<void> toggleTheme() async {
    final newTheme = _currentTheme == AppConstants.lightTheme 
        ? AppConstants.darkTheme 
        : AppConstants.lightTheme;
    await setTheme(newTheme);
  }

  /// Set light theme
  Future<void> setLightTheme() async {
    await setTheme(AppConstants.lightTheme);
  }

  /// Set dark theme
  Future<void> setDarkTheme() async {
    await setTheme(AppConstants.darkTheme);
  }

  /// Set system theme
  Future<void> setSystemTheme() async {
    await setTheme(AppConstants.systemTheme);
  }

  /// Get the effective theme based on system preference
  String getEffectiveTheme(Brightness systemBrightness) {
    if (_currentTheme == AppConstants.systemTheme) {
      return systemBrightness == Brightness.dark 
          ? AppConstants.darkTheme 
          : AppConstants.lightTheme;
    }
    return _currentTheme;
  }

  /// Check if dark mode should be used based on current settings
  bool shouldUseDarkMode(Brightness systemBrightness) {
    final effectiveTheme = getEffectiveTheme(systemBrightness);
    return effectiveTheme == AppConstants.darkTheme;
  }
} 