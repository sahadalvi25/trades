import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/widgets/common/decorations.dart';

class PriceSectionWidget extends StatefulWidget {
  final double price;
  final double change;
  final double changePercent;
  final Color changeColor;
  final String changePrefix;

  const PriceSectionWidget({
    super.key,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.changeColor,
    required this.changePrefix,
  });

  @override
  State<PriceSectionWidget> createState() => _PriceSectionWidgetState();
}

class _PriceSectionWidgetState extends State<PriceSectionWidget> {
  bool _isLineChart = true;

  // Sample data for demonstration - replace with real data
  final List<FlSpot> _lineChartData = [
    const FlSpot(0, 5986),
    const FlSpot(1, 5889),
    const FlSpot(2, 5749),
    const FlSpot(3, 5689),
    const FlSpot(4, 5531),
    const FlSpot(5, 5489),
    const FlSpot(6, 5600),
    const FlSpot(7, 5720),
    const FlSpot(8, 5850),
    const FlSpot(9, 5900),
    const FlSpot(10, 5750),
    const FlSpot(11, 5620),
    const FlSpot(12, 5480),
    const FlSpot(13, 5550),
    const FlSpot(14, 5680),
  ];

  // Sample candlestick data - replace with real data
  final List<CandlestickSpot> _candlestickData = [
    CandlestickSpot(x: 0, open: 5986, high: 6020, low: 5950, close: 5889),
    CandlestickSpot(x: 1, open: 5889, high: 5920, low: 5840, close: 5749),
    CandlestickSpot(x: 2, open: 5749, high: 5780, low: 5700, close: 5689),
    CandlestickSpot(x: 3, open: 5689, high: 5720, low: 5650, close: 5531),
    CandlestickSpot(x: 4, open: 5531, high: 5570, low: 5500, close: 5489),
    CandlestickSpot(x: 5, open: 5489, high: 5520, low: 5450, close: 5600),
    CandlestickSpot(x: 6, open: 5600, high: 5640, low: 5580, close: 5720),
    CandlestickSpot(x: 7, open: 5720, high: 5760, low: 5700, close: 5850),
    CandlestickSpot(x: 8, open: 5850, high: 5890, low: 5830, close: 5900),
    CandlestickSpot(x: 9, open: 5900, high: 5930, low: 5870, close: 5750),
    CandlestickSpot(x: 10, open: 5750, high: 5780, low: 5720, close: 5620),
    CandlestickSpot(x: 11, open: 5620, high: 5650, low: 5590, close: 5480),
    CandlestickSpot(x: 12, open: 5480, high: 5510, low: 5450, close: 5550),
    CandlestickSpot(x: 13, open: 5550, high: 5580, low: 5520, close: 5680),
    CandlestickSpot(x: 14, open: 5680, high: 5710, low: 5650, close: 5720),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              NumberFormat.currency(locale: 'en_US', symbol: '\$').format(widget.price),
              style: ThemeHelper.body1.copyWith(
                color: ThemeHelper.textPrimary, 
                fontWeight: FontWeight.w600,
                fontSize: 32,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              'USD',
              style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              '${widget.changePrefix}${NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 2).format(widget.change)}',
              style: ThemeHelper.caption.copyWith(color: widget.changeColor),
            ),
            const SizedBox(width: 6),
            Text(
              '${widget.changePrefix}${widget.changePercent.toStringAsFixed(2)}%',
              style: ThemeHelper.caption.copyWith(color: widget.changeColor),
            ),
            const SizedBox(width: 6),
            Text(
              'Today',
              style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.paddingL),
        Stack(
          children: [
            _buildChartSection(),
            Positioned(
              right: 0,
              bottom: 32,
              child: _buildChartToggle(),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.paddingM),
      ],
    );
  }

  Widget _buildChartSection() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Column(
        children: [
          Expanded(child: _buildChart()),
        ],
      ),
    );
  }

  Widget _buildChartToggle() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isLineChart = !_isLineChart;
          });
        },
        child: AppDecorations.iconBadge(
          size: 32,
          child: Icon(
            _isLineChart ? HugeIcons.strokeRoundedFilterVertical : HugeIcons.strokeRoundedChart03,
            color: ThemeHelper.textPrimary.withOpacity(0.85),
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    return _isLineChart ? _buildLineChart() : _buildCandlestickChart();
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 200,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white.withOpacity(0.3),
              strokeWidth: 1,
              dashArray: const [5, 5],
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles:  AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2,
               getTitlesWidget: (value, meta) {
                return _buildPriceLabel(value.toInt());
              },
              )),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 120,
              getTitlesWidget: (value, meta) {
                return _buildPriceLabel(value.toInt());
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: _lineChartData.length - 1.0,
        minY: 5400,
        maxY: 6100,
        lineTouchData: LineTouchData(
          enabled: true,
          touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
            setState(() {
              if (event is! FlPanEndEvent) {
              } else {
              }
            });
          },
          getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                FlLine(
                  color: Colors.white.withOpacity(0.25),
                  strokeWidth: 1,
                  dashArray: const [5, 5],
                ),
                FlDotData(
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: widget.changeColor,
                      strokeWidth: 4,
                      strokeColor: widget.changeColor.withOpacity(0.25),
                    );
                  },
                ),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) => Colors.black.withOpacity(0.8),

            tooltipPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                return LineTooltipItem(
                  '\$${NumberFormat('#,###').format(barSpot.y.toInt())}',
                   ThemeHelper.caption.copyWith(
                    color: ThemeHelper.textPrimary,
                    fontSize: 12,
                  ),
                );
              }).toList();
            },
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: _lineChartData,
            isCurved: false,
            color: widget.changeColor,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  widget.changeColor.withOpacity(0.3),
                  widget.changeColor.withOpacity(0.1),
                  widget.changeColor.withOpacity(0.0),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceLabel(int price) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Center(
        child: Text(
          price.toString(),
          style: ThemeHelper.caption.copyWith(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildCandlestickChart() {
    return CandlestickChart(
      CandlestickChartData(
        candlestickSpots: _candlestickData,
        candlestickPainter: DefaultCandlestickPainter(),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles:  AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2,
               getTitlesWidget: (value, meta) {
                return _buildPriceLabel(value.toInt());
              },
              )),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 120,
              getTitlesWidget: (value, meta) {
                return _buildPriceLabel(value.toInt());
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 200,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white.withOpacity(0.3),
              strokeWidth: 1,
              dashArray: const [5, 5],
            );
          },
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: _candlestickData.length - 1.0,
        minY: 5400,
        maxY: 6100,
        candlestickTouchData: CandlestickTouchData(
          enabled: true,
        ),
      ),
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }
}

