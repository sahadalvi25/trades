import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'widgets/index.dart';

class MyAssetsScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const MyAssetsScreen({
    super.key,
    required this.themeProvider,
  });

  @override
  State<MyAssetsScreen> createState() => _MyAssetsScreenState();
}

class _MyAssetsScreenState extends State<MyAssetsScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Assets', 'P&L', 'Transfers', 'History'];

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
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppConstants.paddingM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Net Account Value Card
                        NetAccountValueCard(themeProvider: widget.themeProvider),
                        const SizedBox(height: AppConstants.paddingL),
                        // My Positions Section
                        _buildPositionsHeader(),
                        const SizedBox(height: AppConstants.paddingM),
                        PositionsList(themeProvider: widget.themeProvider),
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
            'Assets',
            style: ThemeHelper.heading1.copyWith(
              color: ThemeHelper.textPrimary,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          // Navigation tabs
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

  Widget _buildPositionsHeader() {
    return Text(
      'My Positions',
      style: ThemeHelper.heading3.copyWith(
        color: ThemeHelper.textPrimary,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.left,
    );
  }
}
