import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/widgets/common/decorations.dart';

class StockHeaderWidget extends StatelessWidget {
  final String companyName;
  final String symbol;
  final String market;

  const StockHeaderWidget({
    super.key,
    required this.companyName,
    required this.symbol,
    required this.market,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: ThemeHelper.textPrimary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusCircle),
          ),
          child: Center(
            child: Text(
              '500',
              style: ThemeHelper.caption.copyWith(
                color: ThemeHelper.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  companyName,
                  style: ThemeHelper.body1.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8),
                AppDecorations.premiumCard(
                  borderRadius: 6,
                  padding: const EdgeInsets.all(0.5),
                  innerPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  child: Text(
                    symbol,
                    style: ThemeHelper.caption.copyWith(color: ThemeHelper.textPrimary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Ticker: $symbol',
                  style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
                ),
                const SizedBox(width: 8),
                _buildBullet(),
                const SizedBox(width: 8),
                Text(
                  market,
                  style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBullet() {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: ThemeHelper.textSecondary,
        shape: BoxShape.circle,
      ),
    );
  }
}
