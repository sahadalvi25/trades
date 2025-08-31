import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class StockListItem extends StatelessWidget {
  final String symbol;
  final String companyName;
  final String price;
  final String change;
  final String changePercent;
  final bool isPositive;
  final bool hasChart;
  final bool isLast;

  const StockListItem({
    super.key,
    required this.symbol,
    required this.companyName,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.isPositive,
    this.hasChart = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: isLast ? null : Border(
          bottom: BorderSide(
            color: isDark ? AppTheme.darkTertiaryBackground : AppTheme.lightTertiaryBackground,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          // Company Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getCompanyColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                _getCompanyInitial(),
                style: AppTextStyles.calloutMedium.copyWith(
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Company Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: AppTextStyles.callout.copyWith(
                    color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  symbol,
                  style: AppTextStyles.caption1.copyWith(
                    color: isDark ? AppTheme.darkSecondary : AppTheme.lightSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          // Chart
          if (hasChart)
            SizedBox(
              width: 80,
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
                      barWidth: 1.5,
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
          
          const SizedBox(width: 12),
          
          // Price Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: AppTextStyles.callout.copyWith(
                  color: isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
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
        ],
      ),
    );
  }

  Color _getCompanyColor() {
    switch (symbol) {
      case 'AAPL':
        return const Color(0xFF000000);
      case 'GOOG':
        return const Color(0xFF4285F4);
      case 'NVDA':
        return const Color(0xFF76B900);
      case 'TSLA':
        return const Color(0xFFE31837);
      default:
        return const Color(0xFF000000);
    }
  }

  String _getCompanyInitial() {
    switch (symbol) {
      case 'AAPL':
        return '';
      case 'GOOG':
        return 'G';
      case 'NVDA':
        return '';
      case 'TSLA':
        return 'T';
      default:
        return symbol[0];
    }
  }

  List<FlSpot> _generateChartData() {
    if (isPositive) {
      return const [
        FlSpot(0, 3),
        FlSpot(1, 2.5),
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
