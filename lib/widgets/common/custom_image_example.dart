import 'package:flutter/cupertino.dart';
import '../../constants/theme_helper.dart';
import '../../constants/app_constants.dart';
import 'custom_image.dart';

/// Example widget demonstrating the usage of CustomImage
class CustomImageExample extends StatelessWidget {
  const CustomImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Custom Image Examples'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Network Images',
                style: ThemeHelper.heading2,
              ),
              const SizedBox(height: AppConstants.paddingM),
              
              // Network image with shimmer
              CustomImage(
                imageUrl: 'https://picsum.photos/200/200?random=1',
                width: 200,
                height: 200,
                onImageLoaded: () => debugPrint('Network image loaded'),
                onImageError: () => debugPrint('Network image failed'),
              ),
              
              const SizedBox(height: AppConstants.paddingM),
              
              // Circular network image
              const CustomImage(
                imageUrl: 'https://picsum.photos/150/150?random=2',
                width: 150,
                height: 150,
              ).circular(size: 150),
              
              const SizedBox(height: AppConstants.paddingL),
              
              Text(
                'Asset Images',
                style: ThemeHelper.heading2,
              ),
              const SizedBox(height: AppConstants.paddingM),
              
              // Asset image (trades logo)
              const CustomImage(
                imageUrl: 'assets/images/trades_logo.png',
                width: 200,
                height: 100,
                isNetworkImage: false,
                fit: BoxFit.contain,
              ),
              
              const SizedBox(height: AppConstants.paddingM),
              
              // Square asset image
              const CustomImage(
                imageUrl: 'assets/images/trades_logo.png',
                width: 100,
                height: 100,
                isNetworkImage: false,
              ).square(size: 100),
              
              const SizedBox(height: AppConstants.paddingL),
              
              Text(
                'Error Handling',
                style: ThemeHelper.heading2,
              ),
              const SizedBox(height: AppConstants.paddingM),
              
              // Invalid URL - will show placeholder
              CustomImage(
                imageUrl: 'https://invalid-url-that-will-fail.com/image.jpg',
                width: 200,
                height: 200,
                onImageError: () => debugPrint('Image failed to load'),
              ),
              
              const SizedBox(height: AppConstants.paddingM),
              
              // Custom error widget
              CustomImage(
                imageUrl: 'https://another-invalid-url.com/image.jpg',
                width: 200,
                height: 200,
                errorWidget: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: ThemeHelper.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    border: Border.all(color: ThemeHelper.error, width: 2),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.exclamationmark_triangle,
                          color: ThemeHelper.error,
                          size: 48,
                        ),
                        const SizedBox(height: AppConstants.paddingS),
                        Text(
                          'Image Failed to Load',
                          style: ThemeHelper.caption.copyWith(
                            color: ThemeHelper.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: AppConstants.paddingL),
              
              Text(
                'Custom Border Radius',
                style: ThemeHelper.heading2,
              ),
              const SizedBox(height: AppConstants.paddingM),
              
              // Custom border radius
              const CustomImage(
                imageUrl: 'https://picsum.photos/200/200?random=3',
                width: 200,
                height: 200,
              ).withBorderRadius(30),
              
              const SizedBox(height: AppConstants.paddingM),
              
              // No shimmer effect
              const CustomImage(
                imageUrl: 'https://picsum.photos/200/200?random=4',
                width: 200,
                height: 200,
                showShimmer: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
