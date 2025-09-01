import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trades/constants/theme_helper.dart';

class MiniLineChart extends StatelessWidget {
  final List<FlSpot> data;
  final bool isPositive;
  final double height;
  final double width;
  final EdgeInsets padding;
  final Color? positiveColor;
  final Color? negativeColor;
  final double barWidth;
  final bool showGradient;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;

  const MiniLineChart({
    super.key,
    required this.data,
    required this.isPositive,
    this.height = 40,
    this.width = double.infinity,
    this.padding = EdgeInsets.zero,
    this.positiveColor,
    this.negativeColor,
    this.barWidth = 1.5,
    this.showGradient = true,
    this.minX = 0,
    this.maxX = 6,
    this.minY = 0,
    this.maxY = 10,
  });

  @override
  Widget build(BuildContext context) {
    final chartColor = isPositive 
        ? (positiveColor ?? ThemeHelper.success)
        : (negativeColor ?? ThemeHelper.error);

    return Container(
      width: width,
      height: height,
      padding: padding,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: false,
              color: chartColor,
              barWidth: barWidth,
              dotData: const FlDotData(show: false),
              belowBarData: showGradient ? BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    chartColor.withValues(alpha: 0.5),
                    chartColor.withValues(alpha: 0.1),
                    chartColor.withValues(alpha: 0.0),
                  ],
                ),
              ) : null,
            ),
          ],
          minX: minX,
          maxX: maxX,
          minY: minY,
          maxY: maxY,
        ),
      ),
    );
  }
}

// Helper class for common chart data patterns
class ChartDataHelper {
  static List<FlSpot> generatePositiveTrend() {
    return const [
      FlSpot(0, 3),
      FlSpot(1, 2.5),
      FlSpot(2, 4),
      FlSpot(3, 3.5),
      FlSpot(4, 5),
      FlSpot(5, 4.5),
      FlSpot(6, 6),
    ];
  }

  static List<FlSpot> generateNegativeTrend() {
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

  static List<FlSpot> generateTrendData(bool isPositive) {
    return isPositive ? generatePositiveTrend() : generateNegativeTrend();
  }
}
