import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class PortfoliosScreen extends StatelessWidget {
  final bool isDarkMode;

  const PortfoliosScreen({
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
          'Portfolios',
          style: AppTextStyles.headline.copyWith(
            color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
          ),
        ),
      ),
      child: Center(
        child: Text(
          'Portfolios Screen',
          style: AppTextStyles.title2.copyWith(
            color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
          ),
        ),
      ),
    );
  }
}
