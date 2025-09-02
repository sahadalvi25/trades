import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'more_details_button_widget.dart';

class EarningsSectionWidget extends StatefulWidget {
  const EarningsSectionWidget({super.key});

  @override
  State<EarningsSectionWidget> createState() => _EarningsSectionWidgetState();
}

class _EarningsSectionWidgetState extends State<EarningsSectionWidget> {
  bool _earningsQuarterly = true;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Earnings', style: ThemeHelper.heading3),
              _buildEarningsToggle(),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(height: 160, child: _buildEarningsChart()),
          const SizedBox(height: 12),
          _buildEarningsMeta(),
          const SizedBox(height: 12),
          const MoreDetailsButtonWidget(),
        ],
      ),
    );
  }

  Widget _buildEarningsToggle() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeHelper.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ThemeHelper.border, width: 1),
      ),
      child: Row(
        children: [
          _buildSegment('Annually', !_earningsQuarterly,
              onTap: () => setState(() => _earningsQuarterly = false)),
          _buildSegment('Quarterly', _earningsQuarterly,
              onTap: () => setState(() => _earningsQuarterly = true)),
        ],
      ),
    );
  }

  Widget _buildSegment(String text, bool selected, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? ThemeHelper.textPrimary : CupertinoColors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: ThemeHelper.caption.copyWith(
            color: selected ? ThemeHelper.textInverse : ThemeHelper.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildEarningsChart() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeHelper.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'Earnings Chart',
          style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
        ),
      ),
    );
  }

  Widget _buildEarningsMeta() {
    Widget item(String k, String v) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                k,
                style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
              ),
              Text(
                v,
                style: ThemeHelper.caption.copyWith(color: ThemeHelper.textPrimary),
              ),
            ],
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 10, height: 10, color: ThemeHelper.textPrimary),
            const SizedBox(width: 6),
            Text(
              'Actual',
              style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
            ),
            const SizedBox(width: 12),
            Container(width: 10, height: 10, color: ThemeHelper.border),
            const SizedBox(width: 6),
            Text(
              'Estimate',
              style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 12),
        item('Next earnings report', 'July 30, 2025'),
        item('Report period', 'Q2 2025'),
        item('EPS estimate', '\$0.46 USD'),
        item('Revenue estimate', '\$23.13B'),
      ],
    );
  }
}
