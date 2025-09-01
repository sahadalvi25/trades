import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/screens/portfolios_screen/widgets/index.dart';

class PortfoliosScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const PortfoliosScreen({
    super.key,
    required this.themeProvider,
  });

  @override
  State<PortfoliosScreen> createState() => _PortfoliosScreenState();
}

class _PortfoliosScreenState extends State<PortfoliosScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'Favorites', 'Categories'];

  // Mock data for portfolios
  final List<PortfolioData> _usGovernmentPortfolios = [
    PortfolioData(
      name: 'Reilge Bozzam',
      title: 'US SENATOR',
      isFavorited: true,
      pnl: 7423.78,
      roi: 6.09,
      isPositive: true,
    ),
    PortfolioData(
      name: 'Reilge Bozzam',
      title: 'US SENATOR',
      isFavorited: false,
      pnl: -7423.78,
      roi: -6.09,
      isPositive: false,
    ),
    PortfolioData(
      name: 'Sarah Johnson',
      title: 'US REPRESENTATIVE',
      isFavorited: true,
      pnl: 5234.12,
      roi: 4.23,
      isPositive: true,
    ),
  ];

  final List<PortfolioData> _celebritiesPortfolios = [
    PortfolioData(
      name: 'Reilge Bozzam',
      title: 'US SENATOR',
      isFavorited: true,
      pnl: 7423.78,
      roi: 6.09,
      isPositive: true,
    ),
    PortfolioData(
      name: 'Reilge Bozzam',
      title: 'US SENATOR',
      isFavorited: false,
      pnl: -7423.78,
      roi: -6.09,
      isPositive: false,
    ),
    PortfolioData(
      name: 'Emma Wilson',
      title: 'ACTOR',
      isFavorited: false,
      pnl: 1890.45,
      roi: -2.15,
      isPositive: false,
    ),
  ];

  final List<PortfolioData> _businessInsidersPortfolios = [
    PortfolioData(
      name: 'Reilge Bozzam',
      title: 'US SENATOR',
      isFavorited: true,
      pnl: 7423.78,
      roi: 6.09,
      isPositive: true,
    ),
    PortfolioData(
      name: 'Reilge Bozzam',
      title: 'US SENATOR',
      isFavorited: false,
      pnl: -7423.78,
      roi: -6.09,
      isPositive: false,
    ),
    PortfolioData(
      name: 'Michael Chen',
      title: 'CEO',
      isFavorited: true,
      pnl: 15678.90,
      roi: 12.45,
      isPositive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        // Update system brightness
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        ThemeHelper.updateSystemBrightness(systemBrightness);
        
        return CupertinoPageScaffold(
          backgroundColor: ThemeHelper.background,
          child: SafeArea(
            child: Column(
              children: [
                // Header with title and filters
                _buildHeader(),
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // US Government Section
                        PortfolioSection(
                          title: 'US GOVERNMENT',
                          portfolios: _usGovernmentPortfolios,
                          onViewAll: () => _onViewAll('US GOVERNMENT'),
                          onPortfolioTap: _onPortfolioTap,
                          onFavoriteToggle: _onFavoriteToggle,
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        // Celebrities Section
                        PortfolioSection(
                          title: 'CELEBRITIES',
                          portfolios: _celebritiesPortfolios,
                          onViewAll: () => _onViewAll('CELEBRITIES'),
                          onPortfolioTap: _onPortfolioTap,
                          onFavoriteToggle: _onFavoriteToggle,
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        // Business Insiders Section
                        PortfolioSection(
                          title: 'BUSINESS INSIDERS',
                          portfolios: _businessInsidersPortfolios,
                          onViewAll: () => _onViewAll('BUSINESS INSIDERS'),
                          onPortfolioTap: _onPortfolioTap,
                          onFavoriteToggle: _onFavoriteToggle,
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main title
          Text(
            'Portfolios',
            style: ThemeHelper.heading1.copyWith(
              color: ThemeHelper.textPrimary,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          // Filter tabs
          Row(
            children: List.generate(_filters.length, (index) {
              final isSelected = index == _selectedFilterIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedFilterIndex = index),
                child: Container(
                  margin: EdgeInsets.only(right: index < _filters.length - 1 ? 12 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? ThemeHelper.surfaceVariant 
                        : CupertinoColors.systemBackground.withOpacity(0),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected 
                          ? ThemeHelper.border 
                          : CupertinoColors.systemBackground.withOpacity(0),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _filters[index],
                        style: ThemeHelper.body2.copyWith(
                          color: isSelected 
                              ? ThemeHelper.textPrimary 
                              : ThemeHelper.textSecondary,
                          fontWeight: isSelected 
                              ? FontWeight.w600 
                              : FontWeight.w400,
                        ),
                      ),
                      if (index == 2) ...[
                        const SizedBox(width: 4),
                        Icon(
                          CupertinoIcons.chevron_down,
                          color: isSelected 
                              ? ThemeHelper.textPrimary 
                              : ThemeHelper.textSecondary,
                          size: 14,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _onViewAll(String category) {
    // TODO: Navigate to category view
    print('View all $category');
  }

  void _onPortfolioTap() {
    // TODO: Navigate to portfolio detail
    print('Portfolio tapped');
  }

  void _onFavoriteToggle(int index, bool isFavorited) {
    setState(() {
      // Update the favorite status for the specific portfolio
      // This is a simplified implementation - in a real app you'd update the data source
      print('Portfolio $index favorite toggled to $isFavorited');
    });
  }
}
