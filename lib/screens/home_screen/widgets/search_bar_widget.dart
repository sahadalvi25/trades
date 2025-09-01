import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class SearchBarWidget extends StatelessWidget {
  final ThemeProvider themeProvider;

  const SearchBarWidget({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              top: BorderSide(
                color: ThemeHelper.border,
                width: 0.5,
              ),
            ),
          ),
          child: Column(
            children: [
              
              // Search Bar
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: ThemeHelper.cardBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(
                      CupertinoIcons.search,
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
                    Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: ThemeHelper.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        CupertinoIcons.sparkles,
                        size: 16,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
