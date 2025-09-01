import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: ThemeHelper.caption.copyWith(
                      color: ThemeHelper.textSecondary,
                      letterSpacing: 0.5,
                    ),
          ),
          if (onViewAll != null)
            GestureDetector(
              onTap: onViewAll,
              child: Text(
                      'View All',
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
