import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/widgets/common/decorations.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import '../../../widgets/common/stock_list_item.dart';
import '../../stock_detail/stock_detail_screen.dart';

class StockDiscoverySection extends StatefulWidget {
  final ThemeProvider themeProvider;
  
  const StockDiscoverySection({
    super.key,
    required this.themeProvider,
  });

  @override
  State<StockDiscoverySection> createState() => _StockDiscoverySectionState();
}

class _StockDiscoverySectionState extends State<StockDiscoverySection> {
  int selectedTabIndex = 0;
  
  final List<String> tabs = ['Stocks', 'Indices', 'Futures', 'Forex', 'Crypto', 'Commodities'];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find your next\ninvestment',
                    style: ThemeHelper.heading2
                  ),
                  AppDecorations.premiumCard(
                    borderRadius: 100,
                    padding: const EdgeInsets.all(0.25),
                    innerPadding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM, vertical: AppConstants.paddingS),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Filter',
                          style: ThemeHelper.caption.copyWith(
                            color: ThemeHelper.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          HugeIcons.strokeRoundedFilterVertical,
                          size: 14,
                          color: ThemeHelper.textPrimary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: AppConstants.paddingL),
            
            // Tab Bar
            Padding(
              padding: const EdgeInsets.only(left: AppConstants.paddingM),
              child: Container(
                decoration: BoxDecoration(
                 border: Border(
                  bottom: BorderSide(
                    color: ThemeHelper.border,
                    width: 1,
                  ),
                  ),
                ),
                height: 25,
                child: ListView.builder(
                  padding: const EdgeInsets.only(right: AppConstants.paddingM),
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedTabIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: index < tabs.length - 1 ? 20 : 0),
                        child: Column(
                          children: [
                            Text(
                              tabs[index],
                              style: ThemeHelper.caption.copyWith(
                                color: isSelected 
                                  ? (ThemeHelper.textPrimary)
                                  : (ThemeHelper.textSecondary),
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 2,
                              width: tabs[index].length * 7.0,
                              decoration: BoxDecoration(
                                color: isSelected 
                                  ? (ThemeHelper.textPrimary)
                                  : CupertinoColors.transparent,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Stock List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
              child: AppDecorations.premiumCard(
                padding: const EdgeInsets.all(1),
                innerPadding: EdgeInsets.zero,
                child: Column(
                  children: [
                    StockListItem(
                      symbol: 'AAPL',
                      companyName: 'Apple Inc',
                      price: 169.75,
                      change: '+6.09',
                      changePercent: '+0.30%',
                      isPositive: true,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                      companyLogoUrl: 'https://logo.clearbit.com/apple.com',
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => StockDetailScreen(
                            themeProvider: widget.themeProvider,
                            symbol: 'AAPL',
                            companyName: 'Apple Inc.',
                            market: 'NASDAQ',
                            price: 346,
                            change: 11.97,
                            changePercent: 0.14,
                            companyLogoUrl: 'https://logo.clearbit.com/apple.com',
                          ),
                        ));
                      },
                    ),
                    StockListItem(
                      symbol: 'GOOG',
                      companyName: 'Google',
                      price: 89.75,
                      change: '+6.09',
                      changePercent: '+0.30%',
                      isPositive: true,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                      companyLogoUrl: 'https://logo.clearbit.com/google.com',
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => StockDetailScreen(
                            themeProvider: widget.themeProvider,
                            symbol: 'GOOGL',
                            companyName: 'Alphabet, Inc.',
                            market: 'NASDAQ',
                            price: 346,
                            change: 11.97,
                            changePercent: 0.14,
                            companyLogoUrl: 'https://logo.clearbit.com/google.com',
                          ),
                        ));
                      },
                    ),
                    StockListItem(
                      symbol: 'NVDA',
                      companyName: 'NVIDIA',
                      price: 122.75,
                      change: '-6.09',
                      changePercent: '-0.30%',
                      isPositive: false,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                      companyLogoUrl: 'https://logo.clearbit.com/nvidia.com',
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => StockDetailScreen(
                            themeProvider: widget.themeProvider,
                            symbol: 'NVDA',
                            companyName: 'NVIDIA Corp.',
                            market: 'NASDAQ',
                            price: 875.28,
                            change: 22.45,
                            changePercent: 2.63,
                            companyLogoUrl: 'https://logo.clearbit.com/nvidia.com',
                          ),
                        ));
                      },
                    ),
                    StockListItem(
                      symbol: 'TSLA',
                      companyName: 'Tesla Inc',
                      price: 39.12,
                      change: '-6.09',
                      changePercent: '-0.30%',
                      isPositive: false,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                      companyLogoUrl: 'https://logo.clearbit.com/tesla.com',
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => StockDetailScreen(
                            themeProvider: widget.themeProvider,
                            symbol: 'TSLA',
                            companyName: 'Tesla, Inc.',
                            market: 'NASDAQ',
                            price: 248.50,
                            change: -12.30,
                            changePercent: -4.72,
                            companyLogoUrl: 'https://logo.clearbit.com/tesla.com',
                          ),
                        ));
                      },
                    ),
                    StockListItem(
                      symbol: 'AMD',
                      companyName: 'AMD',
                      price: 969.75,
                      change: '+6.09',
                      changePercent: '+0.30%',
                      isPositive: true,
                      hasChart: true,
                      isLast: true,
                      themeProvider: widget.themeProvider,
                      companyLogoUrl: 'https://logo.clearbit.com/amd.com',
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => StockDetailScreen(
                            themeProvider: widget.themeProvider,
                            symbol: 'AMD',
                            companyName: 'Advanced Micro Devices',
                            market: 'NASDAQ',
                            price: 178.12,
                            change: 3.25,
                            changePercent: 1.86,
                            companyLogoUrl: 'https://logo.clearbit.com/amd.com',
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // See all button
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle see all
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'See all',
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      CupertinoIcons.arrow_right,
                      size: 16,
                      color: ThemeHelper.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
