import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../theme/text_styles.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppTheme.premiumGradientStart,
            AppTheme.premiumGradientEnd,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Decorative pattern
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  colors: [
                    AppTheme.premiumGradientEnd.withOpacity(0.3),
                    AppTheme.premiumGradientEnd.withOpacity(0.1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: CustomPaint(
                painter: ZigzagPainter(),
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Premium Plans Upto 60% Off',
                  style: AppTextStyles.headline.copyWith(
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Remaining 30 days',
                  style: AppTextStyles.footnote.copyWith(
                    color: CupertinoColors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ZigzagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CupertinoColors.white.withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    const double zigzagWidth = 8;
    const double zigzagHeight = 6;
    
    for (double y = 0; y < size.height; y += zigzagHeight * 2) {
      for (double x = 0; x < size.width; x += zigzagWidth * 2) {
        if (x == 0) {
          path.moveTo(x, y);
        }
        path.lineTo(x + zigzagWidth, y + zigzagHeight);
        path.lineTo(x + zigzagWidth * 2, y);
      }
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
