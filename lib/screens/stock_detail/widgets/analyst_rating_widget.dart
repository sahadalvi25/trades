import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';

class AnalystRatingWidget extends StatelessWidget {
  const AnalystRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Analyst rating', style: ThemeHelper.heading3),
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
              'Analyst Rating Gauge',
              style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
            ),
          ),
        ),
      ],
    );
  }
}
