import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'more_details_button_widget.dart';

class TechnicalsSectionWidget extends StatelessWidget {
  const TechnicalsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Technicals', style: ThemeHelper.heading3),
        const SizedBox(height: 12),
        Container(
          height: 160,
          decoration: BoxDecoration(
            color: ThemeHelper.surfaceVariant,
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
            border: Border.all(color: ThemeHelper.border, width: 1),
          ),
          child: Center(
            child: Text(
              'Technicals Gauge',
              style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const MoreDetailsButtonWidget(),
      ],
    );
  }
}
