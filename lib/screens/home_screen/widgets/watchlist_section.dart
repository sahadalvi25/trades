import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/widgets/common/decorations.dart';
import 'package:trades/widgets/common/custom_image.dart';

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
            const SizedBox(height: AppConstants.paddingS),
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
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Watchlist Cards
            SizedBox(
              height: 165,
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
                    companyLogoUrl: 'https://logo.clearbit.com/apple.com',
                  ),
                  
                  _buildWatchlistCard(
                    symbol: 'GOOGL',
                    companyName: 'Alphabet Inc',
                    price: '\$185.50',
                    change: '-2.15',
                    changePercent: '-1.15%',
                    isPositive: false,
                    companyLogoUrl: 'https://logo.clearbit.com/google.com',
                  ),
                  
                  _buildWatchlistCard(
                    symbol: 'MSFT',
                    companyName: 'Microsoft Corp',
                    price: '\$415.22',
                    change: '+8.45',
                    changePercent: '+2.08%',
                    isPositive: true,
                    companyLogoUrl: 'https://logo.clearbit.com/microsoft.com',
                  ),
                  
                  _buildWatchlistCard(
                    symbol: 'TSLA',
                    companyName: 'Tesla Inc',
                    price: '\$248.50',
                    change: '-12.30',
                    changePercent: '-4.72%',
                    isPositive: false,
                    companyLogoUrl: 'https://logo.clearbit.com/tesla.com',
                  ),
                  
                  _buildWatchlistCard(
                    symbol: 'AMZN',
                    companyName: 'Amazon.com Inc',
                    price: '\$178.12',
                    change: '+3.25',
                    changePercent: '+1.86%',
                    isPositive: true,
                    companyLogoUrl: 'https://logo.clearbit.com/amazon.com',
                  ),
                  
                  _buildWatchlistCard(
                    symbol: 'META',
                    companyName: 'Meta Platforms',
                    price: '\$485.58',
                    change: '+15.67',
                    changePercent: '+3.34%',
                    isPositive: true,
                    companyLogoUrl: 'https://logo.clearbit.com/meta.com',
                  ),
                  
                  _buildWatchlistCard(
                    symbol: 'NVDA',
                    companyName: 'NVIDIA Corp',
                    price: '\$875.28',
                    change: '+22.45',
                    changePercent: '+2.63%',
                    isPositive: true,
                    companyLogoUrl: 'https://logo.clearbit.com/nvidia.com',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),
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
    String? companyLogoUrl,
  }) {
    return AppDecorations.watchlistCard(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Icon and Symbol
          Row(
            children: [
              // Company Logo using CustomImage
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
              const SizedBox(width: 8),
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      symbol,
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        
          // Mini Chart
          SizedBox(
            height: 30,
            child: CustomPaint(
              painter: MiniChartPainter(isPositive: isPositive),
              child: Container(),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Price
          Text(
            price,
            style: ThemeHelper.caption.copyWith(
              color: ThemeHelper.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          
          const SizedBox(height: 4),
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
