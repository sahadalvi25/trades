import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class StockListItem extends StatelessWidget {
  final String symbol;
  final String companyName;
  final String price;
  final String change;
  final String changePercent;
  final bool isPositive;
  final bool hasChart;
  final bool isLast;
  final ThemeProvider themeProvider;

  const StockListItem({
    super.key,
    required this.symbol,
    required this.companyName,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.isPositive,
    required this.themeProvider,
    this.hasChart = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: isLast ? null : Border(
              bottom: BorderSide(
                color: ThemeHelper.border,
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
                  child: _getCompanyIcon(),
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
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      symbol,
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
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
                          color: isPositive ? ThemeHelper.success : ThemeHelper.error,
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
                    style: ThemeHelper.caption.copyWith(
                      color: ThemeHelper.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        change,
                        style: ThemeHelper.caption.copyWith(
                          color: isPositive ? ThemeHelper.success : ThemeHelper.error,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        changePercent,
                        style: ThemeHelper.caption.copyWith(
                          color: isPositive ? ThemeHelper.success : ThemeHelper.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
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
      case 'AMD':
        return const Color(0xFF000000);
      default:
        return const Color(0xFF000000);
    }
  }

  Widget _getCompanyIcon() {
    switch (symbol) {
      case 'AAPL':
        return Text(
          '',
          style: ThemeHelper.caption.copyWith(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
      case 'GOOG':
        return Text(
          'G',
          style: ThemeHelper.caption.copyWith(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'NVDA':
        return Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: CupertinoColors.white,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              CupertinoIcons.eye,
              color: Color(0xFF76B900),
              size: 12,
            ),
          ),
        );
      case 'TSLA':
        return Text(
          'T',
          style: ThemeHelper.caption.copyWith(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'AMD':
        return Text(
          'A',
          style: ThemeHelper.caption.copyWith(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      default:
        return Text(
          symbol[0],
          style: ThemeHelper.caption.copyWith(
            color: CupertinoColors.white,
          ),
        );
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
