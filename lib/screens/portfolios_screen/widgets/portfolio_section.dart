import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/screens/portfolios_screen/widgets/section_header.dart';
import 'package:trades/screens/portfolios_screen/widgets/portfolio_card.dart';

class PortfolioSection extends StatelessWidget {
  final String title;
  final List<PortfolioData> portfolios;
  final VoidCallback? onViewAll;
  final VoidCallback? onPortfolioTap;
  final Function(int, bool)? onFavoriteToggle;

  const PortfolioSection({
    super.key,
    required this.title,
    required this.portfolios,
    this.onViewAll,
    this.onPortfolioTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          onViewAll: onViewAll,
        ),
        SizedBox(
          height: 176,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
            itemCount: portfolios.length,
            itemBuilder: (context, index) {
              final portfolio = portfolios[index];
              return PortfolioCard(
                name: portfolio.name,
                title: portfolio.title,
                isFavorited: portfolio.isFavorited,
                pnl: portfolio.pnl,
                roi: portfolio.roi,
                isPositive: portfolio.isPositive,
                onTap: onPortfolioTap != null ? () => onPortfolioTap!() : null,
                onFavoriteToggle: onFavoriteToggle != null ? () => onFavoriteToggle!(index, !portfolio.isFavorited) : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

class PortfolioData {
  final String name;
  final String title;
  final bool isFavorited;
  final double pnl;
  final double roi;
  final bool isPositive;

  PortfolioData({
    required this.name,
    required this.title,
    required this.isFavorited,
    required this.pnl,
    required this.roi,
    required this.isPositive,
  });
}
