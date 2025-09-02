import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';

class TabSwitchWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  const TabSwitchWidget({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 2; i++)
          GestureDetector(
            onTap: () => onIndexChanged(i),
            child: Container(
              margin: EdgeInsets.only(right: i == 1 ? 0 : 16),
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: selectedIndex == i
                        ? ThemeHelper.textPrimary
                        : ThemeHelper.border,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                i == 0 ? 'Overview' : 'News',
                style: ThemeHelper.body2.copyWith(
                  color: selectedIndex == i
                      ? ThemeHelper.textPrimary
                      : ThemeHelper.textSecondary,
                  fontWeight: selectedIndex == i ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
