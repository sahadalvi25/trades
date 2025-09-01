import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/widgets/common/decorations.dart';
import 'package:trades/widgets/common/mini_line_chart.dart';

class PortfolioCard extends StatelessWidget {
  final String name;
  final String title;
  final bool isFavorited;
  final double pnl;
  final double roi;
  final bool isPositive;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  const PortfolioCard({
    super.key,
    required this.name,
    required this.title,
    required this.isFavorited,
    required this.pnl,
    required this.roi,
    required this.isPositive,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? ThemeHelper.success : ThemeHelper.error;
    
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppConstants.paddingM),
        child: SizedBox(
          width: 180,
          child: AppDecorations.premiumCard(
            padding: const EdgeInsets.all(1),
            innerPadding: const EdgeInsets.all(AppConstants.paddingS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with profile picture and favorite button
                Row(
                  children: [
                    // Profile picture
                    Container(
                      width: 48,
                      height: 60,
                      decoration: BoxDecoration(
                        color: ThemeHelper.cardBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ThemeHelper.border.withOpacity(0.5),
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.person_fill,
                          color: ThemeHelper.textSecondary,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: ThemeHelper.body2.copyWith(
                              color: ThemeHelper.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            title,
                            style: ThemeHelper.caption.copyWith(
                              color: ThemeHelper.textSecondary,
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Favorite button
                    GestureDetector(
                      onTap: onFavoriteToggle,
                      child: Icon(
                        isFavorited 
                            ? CupertinoIcons.star_fill 
                            : CupertinoIcons.star,
                        color: isFavorited 
                            ? CupertinoColors.systemYellow 
                            : ThemeHelper.textSecondary,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // PNL Section
                Row(
                  children: [
                    Text(
                      '90d PNL',
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${isPositive ? '+' : '-'}\$${formatNumberWithCommas(pnl.abs())}',
                      style: ThemeHelper.body2.copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Performance graph
                SizedBox(
                  height: 30,
                  child: MiniLineChart(
                    data: ChartDataHelper.generateTrendData(isPositive),
                    isPositive: isPositive,
                    height: 30,
                    showGradient: true,
                  ),
                ),
                const SizedBox(height: 8),
                // ROI and chevron
                Text(
                      'ROI: ${isPositive ? '+' : ''}${roi.toStringAsFixed(2)}%',
                      style: ThemeHelper.caption.copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
