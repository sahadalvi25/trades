import 'package:flutter/cupertino.dart';
import 'theme/app_theme.dart';
import 'screens/main_tab_view.dart';

void main() {
  runApp(const TradesApp());
}

class TradesApp extends StatefulWidget {
  const TradesApp({super.key});

  @override
  State<TradesApp> createState() => _TradesAppState();
}

class _TradesAppState extends State<TradesApp> {
  bool isDarkMode = true; // Default to dark mode as per screenshot

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Trades',
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: MainTabView(
        isDarkMode: isDarkMode,
        onThemeToggle: toggleTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
