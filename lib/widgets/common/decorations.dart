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

  /// A flexible decoration widget for icons, tags, badges, etc.
  /// Maintains the same design style as premiumCard but with full customization
  /// 
  /// Parameters:
  /// - [child]: The content widget (icon, text, etc.)
  /// - [size]: The size of the container (default: 40x40)
  /// - [borderRadius]: The border radius (default: 12)
  /// - [padding]: The outer padding for the gradient border (default: 0.75)
  /// - [innerPadding]: The inner padding for the content (default: 8)
  /// - [gradientColors]: Custom gradient border colors (optional)
  /// - [gradientStops]: Custom gradient stops (optional)
  /// - [gradientBegin]: Gradient start position (default: centerLeft)
  /// - [gradientEnd]: Gradient end position (default: centerRight)
  /// - [backgroundColors]: Custom background colors (optional)
  /// - [backgroundStops]: Custom background gradient stops (optional)
  /// - [backgroundCenter]: Background gradient center (default: top-right)
  /// - [backgroundRadius]: Background gradient radius (default: 1.2)
  /// - [margin]: Margin around the container (optional)
  /// - [alignment]: Alignment of the child content (default: center)
  /// - [constraints]: Additional constraints for the container (optional)
  static Widget flexibleIconContainer({
    required Widget child,
    double? size,
    double borderRadius = 12,
    EdgeInsets padding = const EdgeInsets.all(0.75),
    EdgeInsets innerPadding = const EdgeInsets.all(8),
    List<Color>? gradientColors,
    List<double>? gradientStops,
    AlignmentGeometry gradientBegin = Alignment.centerLeft,
    AlignmentGeometry gradientEnd = Alignment.centerRight,
    List<Color>? backgroundColors,
    List<double>? backgroundStops,
    Alignment backgroundCenter = const Alignment(0.8, -0.8),
    double backgroundRadius = 1.2,
    EdgeInsets? margin,
    Alignment alignment = Alignment.center,
    BoxConstraints? constraints,
  }) {
    return Container(
      margin: margin,
      constraints: constraints,
      child: Container(
        width: size,
        height: size,
        padding: padding,
        decoration: gradientBorder(
          borderRadius: borderRadius,
          gradientColors: gradientColors,
          gradientStops: gradientStops,
          begin: gradientBegin,
          end: gradientEnd,
        ),
        child: Container(
          width: size != null ? size - (padding.horizontal) : null,
          height: size != null ? size - (padding.vertical) : null,
          padding: innerPadding,
          decoration: radialGradientBackground(
            borderRadius: borderRadius,
            center: backgroundCenter,
            radius: backgroundRadius,
            lightColors: backgroundColors,
            darkColors: backgroundColors,
            stops: backgroundStops,
          ),
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }

  /// A simplified version of flexibleIconContainer for quick icon decorations
  /// 
  /// Parameters:
  /// - [child]: The icon or content widget
  /// - [size]: The size of the container (default: 40)
  /// - [borderRadius]: The border radius (default: 8)
  /// - [padding]: The padding for the gradient border (default: 0.5)
  /// - [innerPadding]: The inner padding (default: 6)
  static Widget iconBadge({
    required Widget child,
    double size = 40,
    double borderRadius = 8,
    EdgeInsets padding = const EdgeInsets.all(0.5),
    EdgeInsets innerPadding = const EdgeInsets.all(6),
  }) {
    return flexibleIconContainer(
      child: child,
      size: size,
      borderRadius: borderRadius,
      padding: padding,
      innerPadding: innerPadding,
    );
  }

  /// A tag-style decoration widget
  /// 
  /// Parameters:
  /// - [child]: The tag content (usually text)
  /// - [height]: The height of the tag (default: 28)
  /// - [borderRadius]: The border radius (default: 14)
  /// - [padding]: The outer padding (default: 0.5)
  /// - [innerPadding]: The inner padding (default: horizontal: 12, vertical: 6)
  static Widget tag({
    required Widget child,
    double height = 28,
    double borderRadius = 14,
    EdgeInsets padding = const EdgeInsets.all(0.5),
    EdgeInsets innerPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  }) {
    return flexibleIconContainer(
      child: child,
      size: null,
      borderRadius: borderRadius,
      padding: padding,
      innerPadding: innerPadding,
      constraints: BoxConstraints(
        minHeight: height,
        minWidth: height,
      ),
    );
  }

  /// A circular icon container
  /// 
  /// Parameters:
  /// - [child]: The icon or content
  /// - [size]: The diameter of the circle (default: 48)
  /// - [padding]: The outer padding (default: 0.5)
  /// - [innerPadding]: The inner padding (default: 12)
  static Widget circularIcon({
    required Widget child,
    double size = 48,
    EdgeInsets padding = const EdgeInsets.all(0.5),
    EdgeInsets innerPadding = const EdgeInsets.all(12),
  }) {
    return flexibleIconContainer(
      child: child,
      size: size,
      borderRadius: size / 2,
      padding: padding,
      innerPadding: innerPadding,
    );
  }
}
