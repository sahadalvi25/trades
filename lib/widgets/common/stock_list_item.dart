import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/widgets/common/custom_image.dart';

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
  final String? companyLogoUrl;

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
    this.companyLogoUrl,
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
              CustomImage(
                imageUrl: companyLogoUrl,
                width: 40,
                height: 40,
                borderRadius: AppConstants.borderRadiusCircle,
                placeholderImage: 'assets/images/trades_logo.png',
                fit: BoxFit.cover,
                showShimmer: true,
                onImageLoaded: () => debugPrint('Company logo loaded for $symbol'),
                onImageError: () => debugPrint('Company logo failed for $symbol'),
              ),
              
              const SizedBox(width: 12),
              
              // Company Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName,
                      style: ThemeHelper.body2.copyWith(
                        color: ThemeHelper.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppConstants.paddingXS),
                    child: SizedBox(
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
                  ),
                ),
              
              const SizedBox(width: 12),
              
              // Price Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: ThemeHelper.body2.copyWith(
                      color: ThemeHelper.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
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
