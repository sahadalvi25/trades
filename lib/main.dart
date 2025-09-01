import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
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
  late ThemeProvider _themeProvider;

  @override
  void initState() {
    super.initState();
    _themeProvider = ThemeProvider();
    // Initialize ThemeHelper with the theme provider
    ThemeHelper.initialize(_themeProvider);
    // Initialize the theme provider
    _themeProvider.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return CupertinoApp(
          title: 'Trades',
          theme: ThemeHelper.cupertinoTheme,
          home: MainTabView(
            themeProvider: _themeProvider,
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
