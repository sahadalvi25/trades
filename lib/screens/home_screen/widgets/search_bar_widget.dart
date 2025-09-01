import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trades/constants/decorations.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class SearchBarWidget extends StatefulWidget {
  final ThemeProvider themeProvider;

  const SearchBarWidget({
    super.key,
    required this.themeProvider,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: AppDecorations.premiumCard(
                  padding: const EdgeInsets.all(1),
                  innerPadding: EdgeInsets.zero,
                  radius: 100,
                  borderRadius: 100,
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: ThemeHelper.cardBackground,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Icon(
                          HugeIcons.strokeRoundedSearch01,
                          size: 20,
                          color: ThemeHelper.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CupertinoTextField(
                            placeholder: 'Search stocks, indices, futures...',
                            placeholderStyle: ThemeHelper.caption.copyWith(
                              color: ThemeHelper.textSecondary,
                            ),
                            style: ThemeHelper.caption.copyWith(
                              color: ThemeHelper.textPrimary,
                            ),
                            decoration: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isPressed = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isPressed = false;
                  });
                  // Handle AI button tap
                },
                onTapCancel: () {
                  setState(() {
                    _isPressed = false;
                  });
                },
                child: AnimatedOpacity(
                  opacity: _isPressed ? 0.6 : 1.0,
                  duration: const Duration(milliseconds: 150),
                  child: Image.asset(
                        'assets/images/ai_button.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
