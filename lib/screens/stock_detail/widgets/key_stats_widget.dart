import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'more_details_button_widget.dart';

class KeyStatsWidget extends StatelessWidget {
  final Map<String, String> stats;

  const KeyStatsWidget({
    super.key,
    Map<String, String>? stats,
  }) : stats = stats ?? const {
          'Market cap:': '1.11T USD',
          'Volume:': '124.44M',
          'P/E (TTM):': '19.716',
          'Net income (FY):': '\$71.3B',
          'Revenue (FY):': '\$97.69B',
          'Shares float:': '2.80B',
          'Beta 1Y:': '2.03',
        };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeHelper.surfaceVariant,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(color: ThemeHelper.border, width: 1),
      ),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Key data points', style: ThemeHelper.heading3),
          const SizedBox(height: 12),
          ...stats.entries.map((entry) => _buildStatRow(entry.key, entry.value)),
          const SizedBox(height: 12),
          const MoreDetailsButtonWidget(),
        ],
      ),
    );
  }

  Widget _buildStatRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
          ),
          Text(
            value,
            style: ThemeHelper.caption.copyWith(color: ThemeHelper.textPrimary),
          ),
        ],
      ),
    );
  }
}
