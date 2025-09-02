import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';

class AboutSectionWidget extends StatelessWidget {
  final Map<String, String> companyInfo;
  final String description;

  const AboutSectionWidget({
    super.key,
    Map<String, String>? companyInfo,
    this.description = 'Alphabet Inc. provides various products and platforms globally, including Google Search, YouTube, Android, Chrome, and Google Cloud. The company generates revenue primarily from advertising and cloud services... ',
  }) : companyInfo = companyInfo ?? const {
          'Sector': 'Communication Services',
          'Industry': 'Internet Content & Information',
          'CEO': 'Sundar Pichai',
          'Website': 'google.com',
          'Headquarters': 'Mountain View, CA',
          'Founded': '1998',
          'FIGI': 'DORA1602DSNR1N',
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
          Text('About', style: ThemeHelper.heading3),
          const SizedBox(height: 12),
          ...companyInfo.entries.map((entry) => _buildInfoRow(entry.key, entry.value)),
          const SizedBox(height: 12),
          Text(
            description,
            style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
          ),
          const SizedBox(height: 8),
          _buildContinueReadingButton(),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
          ),
          Flexible(
            child: Text(
              value,
              style: ThemeHelper.caption.copyWith(color: ThemeHelper.textPrimary),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueReadingButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Continue Reading',
              style: ThemeHelper.caption.copyWith(
                color: ThemeHelper.textPrimary,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(CupertinoIcons.chevron_down, size: 14),
          ],
        ),
      ),
    );
  }
}
