import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class MyAssetsScreen extends StatelessWidget {
  final bool isDarkMode;

  const MyAssetsScreen({
    super.key,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? AppTheme.darkBackground : AppTheme.lightBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
        middle: Text(
          'My Assets',
          style: AppTextStyles.headline.copyWith(
            color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
          ),
        ),
      ),
      child: Center(
        child: Text(
          'My Assets Screen',
          style: AppTextStyles.title2.copyWith(
            color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
          ),
        ),
      ),
    );
  }
}
