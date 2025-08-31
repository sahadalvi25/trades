import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'portfolios_screen.dart';
import 'news_screen.dart';
import 'my_assets_screen.dart';
import 'profile_screen.dart';

class MainTabView extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const MainTabView({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectedIndex = 0;

  final List<String> _tabTitles = [
    'Home',
    'Portfolios',
    'News',
    'My Assets',
    'Profile',
  ];

  final List<IconData> _tabIcons = [
    CupertinoIcons.house_fill,
    CupertinoIcons.chart_pie_fill,
    CupertinoIcons.news_solid,
    CupertinoIcons.briefcase_fill,
    CupertinoIcons.person_fill,
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;
    
    return CupertinoTabScaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      tabBar: CupertinoTabBar(
        backgroundColor: isDark ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
        border: Border(
          top: BorderSide(
            color: isDark ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
            width: 0.5,
          ),
        ),
        activeColor: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
        inactiveColor: isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary,
        currentIndex: _selectedIndex,
        onTap: (index) {
          HapticFeedback.selectionClick();
          setState(() {
            _selectedIndex = index;
          });
        },
        items: List.generate(_tabTitles.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              index == 0 ? CupertinoIcons.house : 
              index == 1 ? CupertinoIcons.chart_pie :
              index == 2 ? CupertinoIcons.news :
              index == 3 ? CupertinoIcons.briefcase :
              CupertinoIcons.person,
              size: 20,
            ),
            activeIcon: Icon(
              _tabIcons[index],
              size: 20,
            ),
            label: _tabTitles[index],
          );
        }),
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return HomeScreen(
              isDarkMode: widget.isDarkMode,
              onThemeToggle: widget.onThemeToggle,
            );
          case 1:
            return PortfoliosScreen(isDarkMode: widget.isDarkMode);
          case 2:
            return NewsScreen(isDarkMode: widget.isDarkMode);
          case 3:
            return MyAssetsScreen(isDarkMode: widget.isDarkMode);
          case 4:
            return ProfileScreen(
              isDarkMode: widget.isDarkMode,
              onThemeToggle: widget.onThemeToggle,
            );
          default:
            return HomeScreen(
              isDarkMode: widget.isDarkMode,
              onThemeToggle: widget.onThemeToggle,
            );
        }
      },
    );
  }
}
