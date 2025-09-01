import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'widgets/premium_banner.dart';
import 'widgets/watchlist_section.dart';
import 'widgets/stock_discovery_section.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const HomeScreen({
    super.key,
    required this.themeProvider,
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
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return CupertinoPageScaffold(
          backgroundColor: ThemeHelper.background,
          child: SafeArea(
            child: Stack(
              children: [
                // Main Content
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: PremiumBanner(themeProvider: widget.themeProvider),
                    ),
                    // Watchlist Section
                    SliverToBoxAdapter(
                      child: WatchlistSection(themeProvider: widget.themeProvider),
                    ),
                    // Stock Discovery Section
                    SliverToBoxAdapter(
                      child: StockDiscoverySection(themeProvider: widget.themeProvider),
                    ),
                    // Bottom padding
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 100),
                    ),
                  ],
                ),
                // Search Bar at Bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SearchBarWidget(themeProvider: widget.themeProvider),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
