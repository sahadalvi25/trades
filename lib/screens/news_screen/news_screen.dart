import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'widgets/index.dart';

class NewsScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const NewsScreen({
    super.key,
    required this.themeProvider,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Daily News', 'Calendar'];
  
  int _selectedFilterIndex = 0;

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
                // Header with title and tabs
                _buildHeader(),
                // Filter controls
                _buildFilterControls(),
                // Content based on selected tab
                Expanded(
                  child: IndexedStack(
                    index: _selectedTabIndex,
                    children: [
                      DailyNewsView(themeProvider: widget.themeProvider),
                      CalendarView(themeProvider: widget.themeProvider),
                    ],
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
            'News',
            style: ThemeHelper.heading1.copyWith(
              color: ThemeHelper.textPrimary,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          // Tab navigation
          Row(
            children: List.generate(_tabs.length, (index) {
              final isSelected = index == _selectedTabIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedTabIndex = index),
                child: Container(
                  margin: EdgeInsets.only(right: index < _tabs.length - 1 ? AppConstants.paddingL : 0),
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected ? ThemeHelper.textPrimary : CupertinoColors.systemBackground.withOpacity(0),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    _tabs[index],
                    style: ThemeHelper.body1.copyWith(
                      color: isSelected 
                          ? ThemeHelper.textPrimary 
                          : ThemeHelper.textSecondary,
                      fontWeight: isSelected 
                          ? FontWeight.w600 
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
      child: Row(
        children: [
          // Important filter button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _selectedFilterIndex == 0 
                  ? ThemeHelper.secondaryCardBackground
                  : CupertinoColors.systemBackground.withOpacity(0),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: GestureDetector(
              onTap: () => setState(() => _selectedFilterIndex = 0),
              child: Text(
                'Important',
                style: ThemeHelper.body2.copyWith(
                  color: _selectedFilterIndex == 0 
                      ? ThemeHelper.textPrimary 
                      : ThemeHelper.textSecondary,
                  fontWeight: _selectedFilterIndex == 0 
                      ? FontWeight.w600 
                      : FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.paddingM),
          // Upcoming dropdown
          GestureDetector(
            onTap: () => setState(() => _selectedFilterIndex = 1),
            child: Row(
              children: [
                Text(
                  'Upcoming',
                  style: ThemeHelper.body2.copyWith(
                    color: _selectedFilterIndex == 1 
                        ? ThemeHelper.textPrimary 
                        : ThemeHelper.textSecondary,
                    fontWeight: _selectedFilterIndex == 1 
                        ? FontWeight.w600 
                        : FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  CupertinoIcons.chevron_down,
                  color: _selectedFilterIndex == 1 
                      ? ThemeHelper.textPrimary 
                      : ThemeHelper.textSecondary,
                  size: 14,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.paddingM),
          // All categories
          GestureDetector(
            onTap: () => setState(() => _selectedFilterIndex = 2),
            child: Text(
              'All categories',
              style: ThemeHelper.body2.copyWith(
                color: _selectedFilterIndex == 2 
                    ? ThemeHelper.textPrimary 
                    : ThemeHelper.textSecondary,
                fontWeight: _selectedFilterIndex == 2 
                    ? FontWeight.w600 
                    : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
