import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class MyAssetsScreen extends StatelessWidget {
  final ThemeProvider themeProvider;

  const MyAssetsScreen({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return CupertinoPageScaffold(
          backgroundColor: ThemeHelper.background,
          navigationBar: CupertinoNavigationBar(
            backgroundColor: ThemeHelper.surfaceVariant,
            middle: Text(
              'My Assets',
              style: ThemeHelper.heading1.copyWith(
                color: ThemeHelper.textPrimary,
              ),
            ),
          ),
          child: Center(
            child: Text(
              'My Assets Screen',
              style: ThemeHelper.heading2.copyWith(
                color: ThemeHelper.textPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}
