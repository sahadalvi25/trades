import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_banner.dart';
import '../widgets/watchlist_section.dart';
import '../widgets/stock_discovery_section.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;
    
    return CupertinoPageScaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      child: SafeArea(
        child: Column(
          children: [
            // Premium Banner
            const PremiumBanner(),
            
            // Main Content
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Watchlist Section
                  const SliverToBoxAdapter(
                    child: WatchlistSection(),
                  ),
                  
                  // Stock Discovery Section
                  const SliverToBoxAdapter(
                    child: StockDiscoverySection(),
                  ),
                  
                  // Bottom padding
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 100),
                  ),
                ],
              ),
            ),
            
            // Search Bar at Bottom
            SearchBarWidget(isDarkMode: isDark),
          ],
        ),
      ),
    );
  }
}
