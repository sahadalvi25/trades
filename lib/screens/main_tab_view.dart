import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'home_screen/home_screen.dart';
import 'portfolios_screen/portfolios_screen.dart';
import 'news_screen/news_screen.dart';
import 'my_assets_screen/my_assets_screen.dart';
import 'profile_screen/profile_screen.dart';
import 'package:hugeicons/hugeicons.dart';

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
    'Portfolio',
    'News',
    'Assets',
    'Profile',
  ];

  final List<IconData> _tabIcons = [
    HugeIcons.strokeRoundedHome01,
    HugeIcons.strokeRoundedCoins01,
    HugeIcons.strokeRoundedNews,
    HugeIcons.strokeRoundedWallet02,
    HugeIcons.strokeRoundedUser,
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
        resizeToAvoidBottomInset: false,
          backgroundColor: ThemeHelper.background,
          tabBar: CupertinoTabBar(
            backgroundColor: ThemeHelper.background,
            border: Border(
              top: BorderSide(
                color: ThemeHelper.border,
                width: 0.5,
              ),
            ),
            activeColor: ThemeHelper.textPrimary,
            inactiveColor: ThemeHelper.textSecondary,
            currentIndex: _selectedIndex,
           height: 64,
            onTap: (index) {
              HapticFeedback.selectionClick();
              setState(() {
                _selectedIndex = index;
              });
            },
            items: List.generate(_tabTitles.length, (index) {
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: _selectedIndex == index 
                              ? ThemeHelper.textPrimary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          _tabIcons[index],
                          size: 18,
                          color: _selectedIndex == index 
                                    ? (ThemeHelper.isDarkMode 
                                        ? const Color(0xFF000000) 
                                        : const Color(0xFFFFFFFF))
                                    : ThemeHelper.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _tabTitles[index],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: _selectedIndex == index 
                              ? ThemeHelper.textPrimary
                              : ThemeHelper.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
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
