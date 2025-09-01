import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class ProfileHeader extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ProfileHeader({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ThemeHelper.primary.withOpacity(0.75), // Darker blue
                ThemeHelper.primary.withOpacity(0.5), // Medium blue
                ThemeHelper.primary.withOpacity(0.25), // Lighter blue
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              SvgPicture.asset(
                'assets/icons/zip_lines.svg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(ThemeHelper.secondaryCardBackground.withOpacity(0.25), BlendMode.srcIn),
              ),
              // User info text
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'John Doe',
                      style: ThemeHelper.heading1.copyWith(
                        color: ThemeHelper.textPrimary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddingS),
                    Text(
                      'johndoe@gmail.com',
                      style: ThemeHelper.body2.copyWith(
                        color: ThemeHelper.textPrimary,
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
