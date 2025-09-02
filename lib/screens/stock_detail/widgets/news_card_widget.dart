import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/widgets/common/decorations.dart';

class NewsCardWidget extends StatelessWidget {
  final String source;
  final String timeAgo;
  final String headline;

  const NewsCardWidget({
    super.key,
    this.source = '24/7 Wall St.',
    this.timeAgo = '8 hours ago',
    this.headline = 'Amazon (AMZN) and Alphabet (GOOG) Are The Cheapest Trillion-Dollar Stocks Today',
  });

  @override
  Widget build(BuildContext context) {
    return AppDecorations.premiumCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.news,
            size: 14,
            color: ThemeHelper.textPrimary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$source  •  $timeAgo',
                  style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
                ),
                const SizedBox(height: 8),
                Text(
                  headline,
                  style: ThemeHelper.body2.copyWith(
                    color: ThemeHelper.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
