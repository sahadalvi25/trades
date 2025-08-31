import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const ProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? AppTheme.darkBackground : AppTheme.lightBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
        middle: Text(
          'Profile',
          style: AppTextStyles.headline.copyWith(
            color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Theme Toggle
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Mode',
                      style: AppTextStyles.callout.copyWith(
                        color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                      ),
                    ),
                    CupertinoSwitch(
                      value: isDarkMode,
                      onChanged: (_) => onThemeToggle(),
                      activeColor: AppTheme.darkAccent,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              Center(
                child: Text(
                  'Profile Screen',
                  style: AppTextStyles.title2.copyWith(
                    color: isDarkMode ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
