import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/widgets/common/decorations.dart';

class MoreDetailsButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const MoreDetailsButtonWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppDecorations.premiumCard(
      borderRadius: 12,
      padding: const EdgeInsets.all(0.5),
      innerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'More Details',
              style: ThemeHelper.body2.copyWith(color: ThemeHelper.textPrimary),
            ),
            const SizedBox(width: 6),
            const Icon(CupertinoIcons.chevron_right, size: 14),
          ],
        ),
      ),
    );
  }
}
