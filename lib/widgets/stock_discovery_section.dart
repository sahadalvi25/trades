import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';
import 'stock_list_item.dart';

class StockDiscoverySection extends StatefulWidget {
  const StockDiscoverySection({super.key});

  @override
  State<StockDiscoverySection> createState() => _StockDiscoverySectionState();
}

class _StockDiscoverySectionState extends State<StockDiscoverySection> {
  int selectedTabIndex = 0;
  
  final List<String> tabs = ['Stocks', 'Indices', 'Futures', 'Forex', 'Crypto'];

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    
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
                style: AppTextStyles.title2.copyWith(
                  color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filter',
                      style: AppTextStyles.footnote.copyWith(
                        color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      CupertinoIcons.slider_horizontal_3,
                      size: 16,
                      color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
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
                          style: AppTextStyles.callout.copyWith(
                            color: isSelected 
                              ? (isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary)
                              : (isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary),
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 2,
                          width: tabs[index].length * 8.0,
                          decoration: BoxDecoration(
                            color: isSelected 
                              ? (isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary)
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
          Container(
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                StockListItem(
                  symbol: 'AAPL',
                  companyName: 'Apple Inc',
                  price: '\$169.75',
                  change: '+6.09',
                  changePercent: '+0.30%',
                  isPositive: true,
                  hasChart: true,
                ),
                StockListItem(
                  symbol: 'GOOG',
                  companyName: 'Google',
                  price: '\$89.75',
                  change: '+6.09',
                  changePercent: '+0.30%',
                  isPositive: true,
                  hasChart: true,
                ),
                StockListItem(
                  symbol: 'NVDA',
                  companyName: 'NVIDIA',
                  price: '\$122.75',
                  change: '-6.09',
                  changePercent: '-0.30%',
                  isPositive: false,
                  hasChart: true,
                ),
                StockListItem(
                  symbol: 'TSLA',
                  companyName: 'Tesla Inc',
                  price: '\$39.12',
                  change: '-6.09',
                  changePercent: '-0.30%',
                  isPositive: false,
                  hasChart: true,
                ),
                StockListItem(
                  symbol: 'AAPL',
                  companyName: 'AMD',
                  price: '\$969.75',
                  change: '+6.09',
                  changePercent: '+0.30%',
                  isPositive: true,
                  hasChart: true,
                  isLast: true,
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
                    style: AppTextStyles.callout.copyWith(
                      color: isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    CupertinoIcons.arrow_right,
                    size: 16,
                    color: isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
