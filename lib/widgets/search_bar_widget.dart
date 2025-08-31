import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  final bool isDarkMode;

  const SearchBarWidget({
    super.key,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
        border: Border(
          top: BorderSide(
            color: isDarkMode ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          // Dow Jones Indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDarkMode ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.search,
                  size: 16,
                  color: isDarkMode ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Dow Jones',
                  style: AppTextStyles.footnote.copyWith(
                    color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '42,270',
                  style: AppTextStyles.footnote.copyWith(
                    color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '-2.5%',
                  style: AppTextStyles.footnote.copyWith(
                    color: AppTheme.red,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Search Bar
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: isDarkMode ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(
                  CupertinoIcons.search,
                  size: 20,
                  color: isDarkMode ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CupertinoTextField(
                    placeholder: 'Search stocks, indices, futures...',
                    placeholderStyle: AppTextStyles.callout.copyWith(
                      color: isDarkMode ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                    ),
                    style: AppTextStyles.callout.copyWith(
                      color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                    ),
                    decoration: null,
                    padding: EdgeInsets.zero,
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.darkAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    CupertinoIcons.sparkles,
                    size: 16,
                    color: CupertinoColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
