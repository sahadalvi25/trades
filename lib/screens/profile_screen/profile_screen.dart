import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/screens/home_screen/widgets/premium_banner.dart';
import 'widgets/index.dart';

class ProfileScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const ProfileScreen({
    super.key,
    required this.themeProvider,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = true;
  bool _alertsEnabled = true;
  String _selectedLanguage = 'En';

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return CupertinoPageScaffold(
          backgroundColor: ThemeHelper.background,
          child: SafeArea(
            child: Column(
              children: [
                // Profile Header with gradient background
                ProfileHeader(themeProvider: widget.themeProvider),
                // Settings Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Your Plan Section
                        SizedBox(
                          width: double.infinity,
                          child: PremiumBanner(themeProvider: widget.themeProvider)),
                        const SizedBox(height: AppConstants.paddingM),
                        // Settings Sections
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
                          child: SettingsSection(
                            themeProvider: widget.themeProvider,
                            isDarkMode: _isDarkMode,
                            onDarkModeChanged: (value) => setState(() => _isDarkMode = value),
                            alertsEnabled: _alertsEnabled,
                            onAlertsChanged: (value) => setState(() => _alertsEnabled = value),
                            selectedLanguage: _selectedLanguage,
                            onLanguageChanged: (value) => setState(() => _selectedLanguage = value),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
