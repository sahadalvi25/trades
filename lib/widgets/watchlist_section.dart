import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';
import 'stock_card.dart';

class WatchlistSection extends StatelessWidget {
  const WatchlistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MY WATCHLIST',
                style: AppTextStyles.caption1.copyWith(
                  color: isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle view all
                },
                child: Text(
                  'View All',
                  style: AppTextStyles.caption1.copyWith(
                    color: isDark ? AppTheme.darkAccent : AppTheme.lightAccent,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Watchlist Cards
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Add Button
                Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isDark ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.plus,
                      color: isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                      size: 24,
                    ),
                  ),
                ),
                
                // Apple Stock Cards
                const StockCard(
                  symbol: 'AAPL',
                  companyName: 'Apple Inc',
                  price: '\$7423.78',
                  change: '+6.09',
                  changePercent: '+0.30%',
                  isPositive: true,
                  hasChart: true,
                ),
                
                const StockCard(
                  symbol: 'AAPL',
                  companyName: 'Apple Inc',
                  price: '\$7423.78',
                  change: '+6.09',
                  changePercent: '+0.30%',
                  isPositive: true,
                  hasChart: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
