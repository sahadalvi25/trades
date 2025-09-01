# CustomImage Widget

A reusable Flutter widget that provides a customizable image component with shimmer loading effects, placeholder images, and comprehensive error handling.

## Features

- ✅ **Shimmer Loading Effect**: Beautiful loading animation that adapts to your app's theme
- ✅ **Placeholder Image**: Default placeholder using `trades_logo.png`
- ✅ **Network & Asset Support**: Load images from URLs or local assets
- ✅ **Error Handling**: Graceful fallback when images fail to load
- ✅ **Theme Integration**: Automatically adapts to light/dark themes
- ✅ **Customizable**: Size, border radius, fit, and more
- ✅ **Extension Methods**: Easy-to-use methods for common use cases

## Installation

The widget uses the `shimmer` package. Add it to your `pubspec.yaml`:

```yaml
dependencies:
  shimmer: ^3.0.0
```

Then run:
```bash
flutter pub get
```

## Basic Usage

### Import the widget

```dart
import 'package:trades/widgets/common/custom_image.dart';
```

### Simple Network Image

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
)
```

### Asset Image

```dart
CustomImage(
  imageUrl: 'assets/images/my_image.png',
  isNetworkImage: false,
  width: 200,
  height: 200,
)
```

### With Callbacks

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
  onImageLoaded: () => print('Image loaded successfully!'),
  onImageError: () => print('Image failed to load'),
)
```

## Advanced Usage

### Custom Error Widget

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
  errorWidget: Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: ThemeHelper.error.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
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
          const SizedBox(height: 8),
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
)
```

### Disable Shimmer Effect

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
  showShimmer: false,
)
```

### Custom Shimmer Duration

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
  shimmerDuration: Duration(milliseconds: 1000),
)
```

## Extension Methods

### Circular Image

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 100,
  height: 100,
).circular(size: 100)
```

### Square Image

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 100,
  height: 100,
).square(size: 100)
```

### Custom Border Radius

```dart
CustomImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
).withBorderRadius(30)
```

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `imageUrl` | `String?` | `null` | The image URL to load |
| `placeholderImage` | `String` | `'assets/images/trades_logo.png'` | Placeholder image path |
| `width` | `double?` | `null` | Image width |
| `height` | `double?` | `null` | Image height |
| `borderRadius` | `double` | `12.0` | Border radius |
| `fit` | `BoxFit` | `BoxFit.cover` | How the image should be fitted |
| `showShimmer` | `bool` | `true` | Whether to show shimmer effect |
| `shimmerDuration` | `Duration` | `350ms` | Shimmer animation duration |
| `errorWidget` | `Widget?` | `null` | Custom error widget |
| `onImageLoaded` | `VoidCallback?` | `null` | Callback when image loads |
| `onImageError` | `VoidCallback?` | `null` | Callback when image fails |
| `isNetworkImage` | `bool` | `true` | Whether image is from network |

## Theme Integration

The widget automatically adapts to your app's theme:

- **Light Theme**: Uses `LightColors.surfaceVariant` and `LightColors.surface` for shimmer
- **Dark Theme**: Uses `DarkColors.surfaceVariant` and `DarkColors.surface` for shimmer
- **Error States**: Uses theme-aware error colors
- **Placeholder**: Uses theme-aware background colors

## Example Implementation

See `custom_image_example.dart` for a comprehensive example showing all features.

## Real-World Usage

The widget is already being used in multiple places:

### WatchlistSection
```dart
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
)
```

### StockListItem
```dart
StockListItem(
  symbol: 'AAPL',
  companyName: 'Apple Inc.',
  price: '\$150.25',
  change: '+2.15',
  changePercent: '+1.45%',
  isPositive: true,
  hasChart: true,
  themeProvider: themeProvider,
  companyLogoUrl: 'https://logo.clearbit.com/apple.com',
)
```

The `StockListItem` widget now uses `CustomImage` internally for company logos, providing:
- Automatic shimmer loading effect
- Fallback to `trades_logo.png` when no logo URL is provided
- Error handling with placeholder display
- Theme-aware loading states

## Best Practices

1. **Always provide dimensions**: Set `width` and `height` for consistent layout
2. **Use appropriate fit**: Choose `BoxFit.cover` for photos, `BoxFit.contain` for logos
3. **Handle errors gracefully**: Provide custom error widgets for better UX
4. **Optimize for performance**: Use appropriate image sizes and formats
5. **Test network conditions**: Ensure your app handles slow or failed image loads

## Troubleshooting

### Image not loading
- Check if the URL is valid and accessible
- Verify network permissions in your app
- Ensure the image format is supported

### Shimmer not showing
- Make sure `showShimmer` is `true`
- Check if the shimmer package is properly installed
- Verify theme colors are available

### Asset image not found
- Ensure the asset path is correct
- Check if the asset is declared in `pubspec.yaml`
- Verify the asset file exists in the specified location
