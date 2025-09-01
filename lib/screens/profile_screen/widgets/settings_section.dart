import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/widgets/common/decorations.dart';

class SettingsSection extends StatelessWidget {
  final ThemeProvider themeProvider;
  final bool isDarkMode;
  final Function(bool) onDarkModeChanged;
  final bool alertsEnabled;
  final Function(bool) onAlertsChanged;
  final String selectedLanguage;
  final Function(String) onLanguageChanged;

  const SettingsSection({
    super.key,
    required this.themeProvider,
    required this.isDarkMode,
    required this.onDarkModeChanged,
    required this.alertsEnabled,
    required this.onAlertsChanged,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        return AppDecorations.premiumCard(
        padding: const EdgeInsets.all(0),
        innerPadding: const EdgeInsets.all(AppConstants.paddingXS),
          child: Column(
            children: [
              _buildSettingItem(
                icon: HugeIcons.strokeRoundedStar,
                title: 'Watchlist',
                showChevron: true,
                onTap: () {},
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: HugeIcons.strokeRoundedPaintBoard,
                title: 'Theme',
                showChevron: false,
                trailing: _buildThemeToggle(),
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: HugeIcons.strokeRoundedImage01,
                title: 'Alerts',
                showChevron: true,
                onTap: () {},
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: HugeIcons.strokeRoundedNotification01,
                title: 'Alert Sound',
                showChevron: true,
                onTap: () {},
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: HugeIcons.strokeRoundedGlobe,
                title: 'Language',
                showChevron: true,
                subtitle: selectedLanguage,
                onTap: () {},
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: HugeIcons.strokeRoundedLogout01,
                title: 'Logout',
                showChevron: true,
                onTap: () {},
                isDestructive: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required bool showChevron,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingS, vertical: AppConstants.paddingM),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: isDestructive 
                    ? LinearGradient(
                        colors: [ThemeHelper.error.withOpacity(0.1), ThemeHelper.error.withOpacity(0.25)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : LinearGradient(
                        colors: [ThemeHelper.secondaryCardBackground.withOpacity(0.5), ThemeHelper.secondaryCardBackground.withOpacity(1)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Icon(
                icon,
                color: isDestructive 
                          ? ThemeHelper.error
                          : ThemeHelper.textPrimary,
                size: 20,
              ),
            ),
            const SizedBox(width: AppConstants.paddingM),
            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ThemeHelper.body1.copyWith(
                      color: isDestructive 
                          ? ThemeHelper.error
                          : ThemeHelper.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppConstants.paddingXS),
                    Text(
                      subtitle,
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Trailing widget or chevron
            if (trailing != null)
              trailing
            else if (showChevron)
              Icon(
                CupertinoIcons.chevron_right,
                color: ThemeHelper.textSecondary,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle() {
    return CupertinoSwitch(
      value: isDarkMode,
      onChanged: onDarkModeChanged,
      activeColor: ThemeHelper.primary,
      trackColor: ThemeHelper.border,
      thumbColor: ThemeHelper.textPrimary,
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
      color: ThemeHelper.divider,
    );
  }
}
