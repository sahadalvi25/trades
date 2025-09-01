import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/widgets/common/decorations.dart';

class NetAccountValueCard extends StatelessWidget {
  final ThemeProvider themeProvider;

  const NetAccountValueCard({
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
          innerPadding: const EdgeInsets.all(AppConstants.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with title and eye icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Net Account Value',
                    style: ThemeHelper.body2.copyWith(
                      color: ThemeHelper.textSecondary,
                    ),
                  ),
                  Icon(
                    HugeIcons.strokeRoundedEye,
                    color: ThemeHelper.textSecondary,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingS),
              // Total value
              Text(
                '\$25,346.78 USD',
                style: ThemeHelper.body1.copyWith(
                  color: ThemeHelper.textPrimary,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: -0.5,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: AppConstants.paddingM),
              // Today's P&L
              Row(
                children: [
                  Text(
                    'Today\'s P&L',
                    style: ThemeHelper.body2.copyWith(
                      color: ThemeHelper.textSecondary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '+11.97',
                    style: ThemeHelper.body2.copyWith(
                      color: ThemeHelper.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  Text(
                    '+0.14%',
                    style: ThemeHelper.body2.copyWith(
                      color: ThemeHelper.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingM),
              // Divider
              Container(
                height: 1,
                color: ThemeHelper.divider,
              ),
              const SizedBox(height: AppConstants.paddingM),
              // Detailed metrics
              Row(
                children: [
                  // Left column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMetricRow('Open P&L', '+11.97', '+0.14%', ThemeHelper.success),
                        const SizedBox(height: AppConstants.paddingS),
                        _buildMetricRow('Settled Cash', '5.32', '', ThemeHelper.textPrimary),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  // Right column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMetricRow('Buying Power', '5.10', '', ThemeHelper.textPrimary),
                        const SizedBox(height: AppConstants.paddingS),
                        _buildMetricRow('Unsettled Cash', '0.00', '', ThemeHelper.textPrimary),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMetricRow(String label, String value, String percentage, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: ThemeHelper.caption.copyWith(
            color: ThemeHelper.textSecondary,
          ),
        ),
        const SizedBox(height: AppConstants.paddingXS),
        Row(
          children: [
            Text(
              value,
              style: ThemeHelper.body2.copyWith(
                color: valueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: AppConstants.paddingM),
             if (percentage.isNotEmpty) ...[
          const SizedBox(height: AppConstants.paddingS),
          Text(
            percentage,
            style: ThemeHelper.body2.copyWith(
              color: valueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
          ],
        ),
       
      ],
    );
  }
}
