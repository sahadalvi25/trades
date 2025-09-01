import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class PremiumBanner extends StatelessWidget {
  final ThemeProvider themeProvider;
  
  const PremiumBanner({
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
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF735135), 
                Color(0xFFC58F62), 
                Color(0xFFCC9E7B), 
              ],
            //  stops: [0.0, 0.20, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              // Decorative pattern using SVG
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 120,
                  child: SvgPicture.asset(
                    'assets/icons/zip_lines.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              // Content
              Padding(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Premium Plans upto 60% off',
                      style: ThemeHelper.body1.copyWith(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 255, 247, 225), // Light orange/pale gold
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Remaining 30 days',
                      style: ThemeHelper.caption.copyWith(
                        color: const Color.fromARGB(255, 255, 247, 225).withOpacity(0.8), // Slightly darker shade
                        fontWeight: FontWeight.w400,
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
