import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class StockCard extends StatelessWidget {
  final String symbol;
  final String companyName;
  final String price;
  final String change;
  final String changePercent;
  final bool isPositive;
  final bool hasChart;

  const StockCard({
    super.key,
    required this.symbol,
    required this.companyName,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.isPositive,
    this.hasChart = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSecondaryBackground : AppTheme.lightSecondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Icon and Symbol
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isDark ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    symbol[0],
                    style: AppTextStyles.calloutMedium.copyWith(
                      color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName,
                      style: AppTextStyles.footnote.copyWith(
                        color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      symbol,
                      style: AppTextStyles.caption2.copyWith(
                        color: isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Chart
          if (hasChart)
            SizedBox(
              height: 40,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _generateChartData(),
                      isCurved: true,
                      color: isPositive ? AppTheme.green : AppTheme.red,
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 10,
                ),
              ),
            ),
          
          const Spacer(),
          
          // Price
          Text(
            price,
            style: AppTextStyles.headline.copyWith(
              color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
            ),
          ),
          
          const SizedBox(height: 4),
          
          // Change
          Row(
            children: [
              Text(
                change,
                style: AppTextStyles.caption1.copyWith(
                  color: isPositive ? AppTheme.green : AppTheme.red,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                changePercent,
                style: AppTextStyles.caption1.copyWith(
                  color: isPositive ? AppTheme.green : AppTheme.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<FlSpot> _generateChartData() {
    if (isPositive) {
      return const [
        FlSpot(0, 3),
        FlSpot(1, 2),
        FlSpot(2, 4),
        FlSpot(3, 3.5),
        FlSpot(4, 5),
        FlSpot(5, 4.5),
        FlSpot(6, 6),
      ];
    } else {
      return const [
        FlSpot(0, 6),
        FlSpot(1, 5.5),
        FlSpot(2, 4),
        FlSpot(3, 4.5),
        FlSpot(4, 3),
        FlSpot(5, 3.5),
        FlSpot(6, 2),
      ];
    }
  }
}
