import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'home_screen/home_screen.dart';
import 'portfolios_screen/portfolios_screen.dart';
import 'news_screen/news_screen.dart';
import 'my_assets_screen/my_assets_screen.dart';
import 'profile_screen/profile_screen.dart';

class MainTabView extends StatefulWidget {
  final ThemeProvider themeProvider;

  const MainTabView({
    super.key,
    required this.themeProvider,
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
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return CupertinoTabScaffold(
          backgroundColor: ThemeHelper.background,
          tabBar: CupertinoTabBar(
            backgroundColor: ThemeHelper.surfaceVariant,
            border: Border(
              top: BorderSide(
                color: ThemeHelper.border,
                width: 0.5,
              ),
            ),
            activeColor: ThemeHelper.primary,
            inactiveColor: ThemeHelper.textSecondary,
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
                return HomeScreen(themeProvider: widget.themeProvider);
              case 1:
                return PortfoliosScreen(themeProvider: widget.themeProvider);
              case 2:
                return NewsScreen(themeProvider: widget.themeProvider);
              case 3:
                return MyAssetsScreen(themeProvider: widget.themeProvider);
              case 4:
                return ProfileScreen(themeProvider: widget.themeProvider);
              default:
                return HomeScreen(themeProvider: widget.themeProvider);
            }
          },
        );
      },
    );
  }
}
