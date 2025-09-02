import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';

/// A reusable gauge meter widget that displays a scale from Strong Sell to Strong Buy
/// and a needle pointing to a provided position.
class GaugeMeter extends StatelessWidget {
  /// 0.0 = Strong Sell, 0.25 = Sell, 0.5 = Neutral, 0.75 = Buy, 1.0 = Strong Buy
  final double value;
  final String title;
  final EdgeInsets? padding;
  final bool showTitle;
  final double height;

  const GaugeMeter({
    super.key,
    required this.value,
    this.title = 'Technicals',
    this.padding,
    this.showTitle = true,
    this.height = 160,
  });

  Color _segmentColor(double t) {
    // Map t [0..1] into a gradient across red -> gray -> green
    if (t < 0.2) return ThemeHelper.error.withOpacity(0.9);
    if (t < 0.4) return ThemeHelper.error.withOpacity(0.6);
    if (t < 0.6) return ThemeHelper.textSecondary.withOpacity(0.9);
    if (t < 0.8) return ThemeHelper.success.withOpacity(0.6);
    return ThemeHelper.success.withOpacity(0.9);
  }

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);
    return Container(
      decoration: BoxDecoration(
        color: ThemeHelper.surfaceVariant,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(color: ThemeHelper.border, width: 1),
      ),
      padding: padding ?? const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle) ...[
            Text(
              title,
              style: ThemeHelper.heading3,
            ),
            const SizedBox(height: AppConstants.paddingS),
          ],
          SizedBox(
            height: height,
            width: double.infinity,
            child: CustomPaint(
              painter: _GaugePainter(
                needleT: clamped,
                colorResolver: _segmentColor,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _label('Strong sell'),
              _label('Sell'),
              _label('Neutral'),
              _label('Buy'),
              _label('Strong buy'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double needleT; // 0..1
  final Color Function(double t) colorResolver;

  _GaugePainter({required this.needleT, required this.colorResolver});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final center = Offset(width / 2, height * 0.95);
    final radius = width * 0.48;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final startAngle = math.pi; // 180 degrees
    final sweepAngle = math.pi; // half circle

    // Draw background segments (5 segments)
    const segments = 5;
    for (int i = 0; i < segments; i++) {
      final t0 = i / segments;
      final t1 = (i + 1) / segments;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round
        ..color = colorResolver((t0 + t1) / 2);

      final a0 = startAngle + sweepAngle * t0;
      final a1 = startAngle + sweepAngle * t1;
      canvas.drawArc(rect, a0, a1 - a0, false, paint);
    }

    // Draw needle
    final needleAngle = startAngle + sweepAngle * needleT;
    final needleLength = radius * 0.8;
    final needleEnd = Offset(
      center.dx + needleLength * math.cos(needleAngle),
      center.dy + needleLength * math.sin(needleAngle),
    );
    final needlePaint = Paint()
      ..color = ThemeHelper.textPrimary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawLine(center, needleEnd, needlePaint);

    final hubPaint = Paint()..color = ThemeHelper.surface;
    canvas.drawCircle(center, 6, hubPaint);
    canvas.drawCircle(center, 6, Paint()
      ..color = ThemeHelper.textPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.needleT != needleT;
  }
}


