import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/widgets/common/custom_image.dart';
import 'package:trades/widgets/common/decorations.dart';

class PositionsList extends StatelessWidget {
  final ThemeProvider themeProvider;

  const PositionsList({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        return AppDecorations.premiumCard(
          padding: const EdgeInsets.all(1),
          innerPadding: const EdgeInsets.all(AppConstants.paddingXS),
          child: Column(
            children: _buildPositions(),
          ),
        );
      },
    );
  }

  List<Widget> _buildPositions() {
    // Mock positions data based on the screenshot
    final List<Position> positions = [
      Position(
        companyName: 'Apple.Inc',
        ticker: 'AAPL',
        quantity: '5.34',
        shares: '0.0123',
        value: '204.29',
        price: '\$123.42',
        pnl: '+12.08',
        percentage: '+0.30%',
        isPositive: true,
      ),
      Position(
        companyName: 'Nvidia',
        ticker: 'NVDA',
        quantity: '5.34',
        shares: '0.0123',
        value: '204.29',
        price: '\$123.42',
        pnl: '-6.09',
        percentage: '+0.30%',
        isPositive: false,
      ),
      Position(
        companyName: 'Amazon.Inc',
        ticker: 'AMZN',
        quantity: '5.34',
        shares: '0.0123',
        value: '204.29',
        price: '\$123.42',
        pnl: '+12.08',
        percentage: '+0.30%',
        isPositive: true,
      ),
      Position(
        companyName: 'AMD',
        ticker: 'AMD',
        quantity: '5.34',
        shares: '0.0123',
        value: '204.29',
        price: '\$123.42',
        pnl: '+12.08',
        percentage: '+0.30%',
        isPositive: true,
      ),
      Position(
        companyName: 'Apple.Inc',
        ticker: 'AAPL',
        quantity: '5.34',
        shares: '0.0123',
        value: '204.29',
        price: '\$123.42',
        pnl: '+12.08',
        percentage: '+0.30%',
        isPositive: true,
      ),
    ];

    return positions.map((position) => _buildPositionItem(position)).toList();
  }

  Widget _buildPositionItem(Position position) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingS, vertical: AppConstants.paddingM),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ThemeHelper.border,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          // Company logo (circular placeholder)
          CustomImage(
            imageUrl: _getCompanyImageUrl(position.ticker),
            width: 40,
            height: 40,
            borderRadius: 20, // Make it circular
            fit: BoxFit.cover,
            showShimmer: true,
            errorWidget: _buildCompanyLogoFallback(position.ticker),
            isNetworkImage: true,
          ),
          const SizedBox(width: AppConstants.paddingM),
          // Company name and ticker
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position.companyName,
                  style: ThemeHelper.body2.copyWith(
                    color: ThemeHelper.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppConstants.paddingXS),
                Text(
                  position.ticker,
                  style: ThemeHelper.caption.copyWith(
                    color: ThemeHelper.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Quantity and shares
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  position.quantity,
                  style: ThemeHelper.caption.copyWith(
                    color: ThemeHelper.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  position.shares,
                  style: ThemeHelper.caption.copyWith(
                    color: ThemeHelper.textSecondary,
                    fontSize: 10
                  ),
                ),
              ],
            ),
          ),
          // Value and price
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  position.value,
                  style: ThemeHelper.caption.copyWith(
                    color: ThemeHelper.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  position.price,
                  style: ThemeHelper.caption.copyWith(
                    color: ThemeHelper.textSecondary,
                    fontSize: 10
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.paddingM),
          // P&L and percentage
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: position.isPositive 
                    ?  LinearGradient(
                        colors: [ThemeHelper.success.withOpacity(0.1), ThemeHelper.success.withOpacity(0.35)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : LinearGradient(
                        colors: [ThemeHelper.error.withOpacity(0.1), ThemeHelper.error.withOpacity(0.25)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                ),
                child: Text(
                  position.pnl,
                  style: ThemeHelper.caption.copyWith(
                    color: position.isPositive ? ThemeHelper.success : ThemeHelper.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                position.percentage,
                style: ThemeHelper.caption.copyWith(
                  color: position.isPositive ? ThemeHelper.success : ThemeHelper.error,
                  fontWeight: FontWeight.w600,
                  fontSize: 10
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getCompanyColor(String ticker) {
    switch (ticker) {
      case 'AAPL':
        return const Color(0xFF000000); // Apple black
      case 'NVDA':
        return const Color(0xFF76B900); // Nvidia green
      case 'AMZN':
        return const Color(0xFFFF9900); // Amazon orange
      case 'AMD':
        return const Color(0xFFED1C24); // AMD red
      default:
        return ThemeHelper.primary;
    }
  }

  String _getCompanyInitial(String ticker) {
    switch (ticker) {
      case 'AAPL':
        return 'A';
      case 'NVDA':
        return 'N';
      case 'AMZN':
        return 'A';
      case 'AMD':
        return 'A';
      default:
        return ticker[0];
    }
  }

  /// Returns the company logo image URL based on ticker
  String? _getCompanyImageUrl(String ticker) {
    switch (ticker) {
      case 'AAPL':
        return 'https://logo.clearbit.com/apple.com';
      case 'NVDA':
        return 'https://logo.clearbit.com/nvidia.com';
      case 'AMZN':
        return 'https://logo.clearbit.com/amazon.com';
      case 'AMD':
        return 'https://logo.clearbit.com/amd.com';
      default:
        return null; // Return null for unknown companies
    }
  }

  /// Builds a fallback company logo widget when image fails to load
  Widget _buildCompanyLogoFallback(String ticker) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _getCompanyColor(ticker),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _getCompanyInitial(ticker),
          style: ThemeHelper.body1.copyWith(
            color: ThemeHelper.textInverse,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class Position {
  final String companyName;
  final String ticker;
  final String quantity;
  final String shares;
  final String value;
  final String price;
  final String pnl;
  final String percentage;
  final bool isPositive;

  Position({
    required this.companyName,
    required this.ticker,
    required this.quantity,
    required this.shares,
    required this.value,
    required this.price,
    required this.pnl,
    required this.percentage,
    required this.isPositive,
  });
}
