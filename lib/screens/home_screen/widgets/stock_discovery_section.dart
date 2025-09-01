import 'package:flutter/cupertino.dart';
import 'package:trades/constants/decorations.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import '../../../widgets/common/stock_list_item.dart';

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
  
  final List<String> tabs = ['Stocks', 'Indices', 'Futures', 'Forex', 'Crypto'];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find your next\ninvestment',
                    style: ThemeHelper.heading2
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: ThemeHelper.surfaceVariant,
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                          CupertinoIcons.slider_horizontal_3,
                          size: 16,
                          color: ThemeHelper.textPrimary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Tab Bar
              SizedBox(
                height: 32,
                child: ListView.builder(
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
                        margin: EdgeInsets.only(right: index < tabs.length - 1 ? 24 : 0),
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
                              width: tabs[index].length * 8.0,
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
              
              const SizedBox(height: 24),
              
              // Stock List
              AppDecorations.premiumCard(
                padding: const EdgeInsets.all(1),
                innerPadding: EdgeInsets.zero,
                child: Column(
                  children: [
                    StockListItem(
                      symbol: 'AAPL',
                      companyName: 'Apple Inc',
                      price: '\$169.75',
                      change: '+6.09',
                      changePercent: '+0.30%',
                      isPositive: true,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                    ),
                    StockListItem(
                      symbol: 'GOOG',
                      companyName: 'Google',
                      price: '\$89.75',
                      change: '+6.09',
                      changePercent: '+0.30%',
                      isPositive: true,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                    ),
                    StockListItem(
                      symbol: 'NVDA',
                      companyName: 'NVIDIA',
                      price: '\$122.75',
                      change: '-6.09',
                      changePercent: '-0.30%',
                      isPositive: false,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                    ),
                    StockListItem(
                      symbol: 'TSLA',
                      companyName: 'Tesla Inc',
                      price: '\$39.12',
                      change: '-6.09',
                      changePercent: '-0.30%',
                      isPositive: false,
                      hasChart: true,
                      themeProvider: widget.themeProvider,
                    ),
                    StockListItem(
                      symbol: 'AMD',
                      companyName: 'AMD',
                      price: '\$969.75',
                      change: '+6.09',
                      changePercent: '+0.30%',
                      isPositive: true,
                      hasChart: true,
                      isLast: true,
                      themeProvider: widget.themeProvider,
                    ),
                  ],
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
          ),
        );
      },
    );
  }
}
