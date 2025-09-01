import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';

class AppDecorations {

  /// Parameters:
  /// - [borderRadius]: The border radius for the container (default: 12)
  /// - [gradientColors]: Custom gradient colors (optional)
  /// - [gradientStops]: Custom gradient stops (optional)
  /// - [begin]: Gradient start position (default: centerLeft)
  /// - [end]: Gradient end position (default: centerRight)
  static BoxDecoration gradientBorder({
    double borderRadius = 12,
    List<Color>? gradientColors,
    List<double>? gradientStops,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors ?? [
          CupertinoColors.white.withOpacity(0.15),
          CupertinoColors.white.withOpacity(0.35),
          CupertinoColors.white.withOpacity(0.85),
          CupertinoColors.white.withOpacity(0.35),
          CupertinoColors.white.withOpacity(0.15),
        ],
        stops: gradientStops,
        begin: begin,
        end: end,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  /// Parameters:
  /// - [borderRadius]: The border radius for the container (default: 12)
  /// - [center]: The center of the radial gradient (default: top-right)
  /// - [radius]: The radius of the gradient (default: 1.2)
  /// - [lightColors]: Custom light mode colors (optional)
  /// - [darkColors]: Custom dark mode colors (optional)
  /// - [stops]: Custom gradient stops (optional)
  static BoxDecoration radialGradientBackground({
    double borderRadius = 12,
    Alignment center = const Alignment(0.8, -0.8),
    double radius = 1.2,
    List<Color>? lightColors,
    List<Color>? darkColors,
    List<double>? stops,
  }) {
    return BoxDecoration(
      gradient: RadialGradient(
        center: center,
        radius: radius,
        colors: ThemeHelper.isDarkMode
            ? darkColors ?? [
                const Color(0xFF373941).withOpacity(1),
                const Color(0xFF1C1E26).withOpacity(0.95),
                ThemeHelper.surfaceVariant,
              ]
            : lightColors ?? [
                const Color(0xFFFAFBFC).withOpacity(0.9),
                const Color(0xFFF5F7FA).withOpacity(0.95),
                ThemeHelper.surfaceVariant,
              ],
        stops: stops ?? const [0.0, 0.3, 1.0],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  /// Parameters:
  /// - [borderRadius]: The border radius for the container (default: 12)
  /// - [borderColor]: Custom border color (optional)
  /// - [borderWidth]: Custom border width (default: 1)
  /// - [backgroundColor]: Custom background color (optional)
  static BoxDecoration surfaceVariant({
    double borderRadius = 12,
    Color? borderColor,
    double borderWidth = 1,
    Color? backgroundColor,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? ThemeHelper.surfaceVariant,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor ?? ThemeHelper.border,
        width: borderWidth,
      ),
    );
  }

  /// Parameters:
  /// - [borderRadius]: The border radius for the container (default: 12)
  /// - [padding]: The padding for the inner container (default: 0.75)
  /// - [innerPadding]: The padding for the content (default: 16)
  /// - [center]: The center of the radial gradient (default: top-right)
  /// - [radius]: The radius of the gradient (default: 1.2)
  static Widget premiumCard({
    required Widget child,
    double borderRadius = 12,
    EdgeInsets padding = const EdgeInsets.all(0.75),
    EdgeInsets innerPadding = const EdgeInsets.all(16),
    Alignment center = const Alignment(0.8, -0.8),
    double radius = 1.2,
  }) {
    return Container(
      padding: padding,
      decoration: gradientBorder(borderRadius: borderRadius),
      child: Container(
        padding: innerPadding,
        decoration: radialGradientBackground(
          borderRadius: borderRadius,
          center: center,
          radius: radius,
        ),
        child: child,
      ),
    );
  }

  /// Parameters:
  /// - [width]: The width of the card (default: 180)
  /// - [margin]: The margin around the card (default: right: 12)
  /// - [borderRadius]: The border radius for the container (default: 12)
  static Widget watchlistCard({
    required Widget child,
    double width = 180,
    EdgeInsets margin = const EdgeInsets.only(right: 12),
    double borderRadius = 12,
  }) {
    return Container(
      width: width,
      margin: margin,
      child: premiumCard(
        child: child,
        borderRadius: borderRadius,
      ),
    );
  }
}
