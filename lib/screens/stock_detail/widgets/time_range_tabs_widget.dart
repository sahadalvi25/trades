import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';

class TimeRangeTabsWidget extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  const TimeRangeTabsWidget({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  State<TimeRangeTabsWidget> createState() => _TimeRangeTabsWidgetState();
}

class _TimeRangeTabsWidgetState extends State<TimeRangeTabsWidget> {
  final List<String> _timeRanges = ['1D', '5D', '1M', '3M', '6M', '1Y', 'ALL'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < _timeRanges.length; i++)
          Padding(
            padding: EdgeInsets.only(right: i == _timeRanges.length - 1 ? 0 : 8),
            child: GestureDetector(
              onTap: () => widget.onIndexChanged(i),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.selectedIndex == i
                      ? ThemeHelper.textPrimary
                      : CupertinoColors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ThemeHelper.border, width: 1),
                ),
                child: Row(
                  children: [
                    Text(
                      _timeRanges[i],
                      style: ThemeHelper.caption.copyWith(
                        color: widget.selectedIndex == i
                            ? ThemeHelper.textInverse
                            : ThemeHelper.textSecondary,
                      ),
                    ),
                    if (_timeRanges[i] == 'ALL') ...[
                      const SizedBox(width: 6),
                      Icon(
                        CupertinoIcons.fullscreen,
                        size: 14,
                        color: widget.selectedIndex == i
                            ? ThemeHelper.textInverse
                            : ThemeHelper.textSecondary,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
