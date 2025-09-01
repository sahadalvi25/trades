import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import '../../constants/theme_helper.dart';
import '../../constants/app_constants.dart';

/// A custom reusable image widget with shimmer loading effect
class CustomImage extends StatefulWidget {
  /// The image URL to load (can be network URL or asset path)
  final String? imageUrl;
  
  /// The placeholder image to show while loading or on error
  final String placeholderImage;
  
  /// Width of the image
  final double? width;
  
  /// Height of the image
  final double? height;
  
  /// Border radius for the image
  final double borderRadius;
  
  /// Box fit for the image
  final BoxFit fit;
  
  /// Whether to show shimmer loading effect
  final bool showShimmer;
  
  /// Duration for shimmer animation
  final Duration shimmerDuration;
  
  /// Error widget to show when image fails to load
  final Widget? errorWidget;
  
  /// Callback when image loads successfully
  final VoidCallback? onImageLoaded;
  
  /// Callback when image fails to load
  final VoidCallback? onImageError;
  
  /// Whether the image is from network (true) or asset (false)
  final bool isNetworkImage;

  const CustomImage({
    super.key,
    this.imageUrl,
    this.placeholderImage = 'assets/images/trades_logo.png',
    this.width,
    this.height,
    this.borderRadius = AppConstants.borderRadius,
    this.fit = BoxFit.cover,
    this.showShimmer = true,
    this.shimmerDuration = AppConstants.mediumAnimation,
    this.errorWidget,
    this.onImageLoaded,
    this.onImageError,
    this.isNetworkImage = true,
  });

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  bool _isLoading = true;
  bool _hasError = false;
  late ImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(CustomImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _loadImage();
    }
  }

  void _loadImage() {
    if (widget.imageUrl == null || widget.imageUrl!.isEmpty) {
      _setPlaceholderImage();
      return;
    }

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      if (widget.isNetworkImage) {
        _imageProvider = NetworkImage(widget.imageUrl!);
      } else {
        _imageProvider = AssetImage(widget.imageUrl!);
      }

      // Preload the image
      _imageProvider.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener(
          (info, _) {
            if (mounted) {
              setState(() {
                _isLoading = false;
                _hasError = false;
              });
              widget.onImageLoaded?.call();
            }
          },
          onError: (exception, stackTrace) {
            if (mounted) {
              setState(() {
                _isLoading = false;
                _hasError = true;
              });
              widget.onImageError?.call();
            }
          },
        ),
      );
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
        widget.onImageError?.call();
      }
    }
  }

  void _setPlaceholderImage() {
    setState(() {
      _isLoading = false;
      _hasError = false;
      _imageProvider = AssetImage(widget.placeholderImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    if (_isLoading && widget.showShimmer) {
      return _buildShimmerWidget();
    }

    if (_hasError) {
      return _buildErrorWidget();
    }

    return Image(
      image: _imageProvider,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildShimmerWidget() {
    return Shimmer.fromColors(
      baseColor: ThemeHelper.surfaceVariant,
      highlightColor: ThemeHelper.surface,
      period: widget.shimmerDuration,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: ThemeHelper.surfaceVariant,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    if (widget.errorWidget != null) {
      return widget.errorWidget!;
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: ThemeHelper.surfaceVariant,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Center(
        child: Image.asset(
          widget.placeholderImage,
          width: (widget.width ?? 100) * 0.5,
          height: (widget.height ?? 100) * 0.5,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

/// Extension methods for easier usage
extension CustomImageExtensions on CustomImage {
  /// Create a circular image
  CustomImage circular({double? size}) {
    return CustomImage(
      imageUrl: imageUrl,
      placeholderImage: placeholderImage,
      width: size,
      height: size,
      borderRadius: size != null ? size / 2 : AppConstants.borderRadiusCircle,
      fit: fit,
      showShimmer: showShimmer,
      shimmerDuration: shimmerDuration,
      errorWidget: errorWidget,
      onImageLoaded: onImageLoaded,
      onImageError: onImageError,
      isNetworkImage: isNetworkImage,
    );
  }

  /// Create a square image
  CustomImage square({double? size}) {
    return CustomImage(
      imageUrl: imageUrl,
      placeholderImage: placeholderImage,
      width: size,
      height: size,
      borderRadius: borderRadius,
      fit: fit,
      showShimmer: showShimmer,
      shimmerDuration: shimmerDuration,
      errorWidget: errorWidget,
      onImageLoaded: onImageLoaded,
      onImageError: onImageError,
      isNetworkImage: isNetworkImage,
    );
  }

  /// Create an image with custom border radius
  CustomImage withBorderRadius(double radius) {
    return CustomImage(
      imageUrl: imageUrl,
      placeholderImage: placeholderImage,
      width: width,
      height: height,
      borderRadius: radius,
      fit: fit,
      showShimmer: showShimmer,
      shimmerDuration: shimmerDuration,
      errorWidget: errorWidget,
      onImageLoaded: onImageLoaded,
      onImageError: onImageError,
      isNetworkImage: isNetworkImage,
    );
  }
}
