import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/constants/decorations.dart';

class WatchlistSection extends StatelessWidget {
  final ThemeProvider themeProvider;
  
  const WatchlistSection({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
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
                    'MY WATCHLIST',
                    style: ThemeHelper.caption.copyWith(
                      color: ThemeHelper.textSecondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle view all
                    },
                    child: Text(
                      'View All',
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Watchlist Cards
            SizedBox(
              height: 168,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
                scrollDirection: Axis.horizontal,
                children: [
                  // Add Button
                  Container(
                    width: 52,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: ThemeHelper.textPrimary.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.plus,
                        color: ThemeHelper.textInverse,
                        size: 24,
                      ),
                    ),
                  ),
                  
                  // Apple Stock Cards
                  _buildWatchlistCard(
                    symbol: 'AAPL',
                    companyName: 'Apple Inc',
                    price: '\$7423.78',
                    change: '+6.09',
                    changePercent: '+0.30%',
                    isPositive: true,
                  ),
                  
                  _buildWatchlistCard(
                    symbol: 'AAPL',
                    companyName: 'Apple Inc',
                    price: '\$7423.78',
                    change: '+6.09',
                    changePercent: '+0.30%',
                    isPositive: true,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWatchlistCard({
    required String symbol,
    required String companyName,
    required String price,
    required String change,
    required String changePercent,
    required bool isPositive,
  }) {
    return AppDecorations.watchlistCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Icon and Symbol
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF000000),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    '',
                    style: ThemeHelper.caption.copyWith(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                symbol,
                style: ThemeHelper.caption.copyWith(
                  color: ThemeHelper.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Company Name
          Text(
            companyName,
            style: ThemeHelper.caption.copyWith(
              color: ThemeHelper.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Mini Chart
          Container(
            height: 30,
            child: CustomPaint(
              painter: MiniChartPainter(isPositive: isPositive),
              child: Container(),
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Price
          Text(
            price,
            style: ThemeHelper.caption.copyWith(
              color: ThemeHelper.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          
          // Change
          Row(
            children: [
              Text(
                change,
                style: ThemeHelper.caption.copyWith(
                  color: isPositive ? ThemeHelper.success : ThemeHelper.error,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                changePercent,
                style: ThemeHelper.caption.copyWith(
                  color: isPositive ? ThemeHelper.success : ThemeHelper.error,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniChartPainter extends CustomPainter {
  final bool isPositive;
  
  MiniChartPainter({required this.isPositive});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isPositive ? ThemeHelper.success : ThemeHelper.error
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // Generate some sample chart data
    final points = isPositive 
      ? [0.8, 0.6, 0.7, 0.5, 0.3, 0.4, 0.2]
      : [0.2, 0.4, 0.3, 0.5, 0.7, 0.6, 0.8];
    
    for (int i = 0; i < points.length; i++) {
      final x = (i / (points.length - 1)) * size.width;
      final y = points[i] * size.height;
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
