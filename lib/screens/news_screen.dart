import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class NewsScreen extends StatelessWidget {
  final bool isDarkMode;

  const NewsScreen({
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
          'News',
          style: AppTextStyles.headline.copyWith(
            color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
          ),
        ),
      ),
      child: Center(
        child: Text(
          'News Screen',
          style: AppTextStyles.title2.copyWith(
            color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
          ),
        ),
      ),
    );
  }
}
