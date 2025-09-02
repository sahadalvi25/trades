import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/widgets/common/decorations.dart';
import 'widgets/index.dart';

class StockDetailScreen extends StatefulWidget {
  final ThemeProvider themeProvider;
  final String symbol;
  final String companyName;
  final String market;
  final String? companyLogoUrl;
  final double price;
  final double change;
  final double changePercent;

  const StockDetailScreen({
    super.key,
    required this.themeProvider,
    required this.symbol,
    required this.companyName,
    required this.market,
    required this.price,
    required this.change,
    required this.changePercent,
    this.companyLogoUrl,
  });

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  int _selectedTimeIndex = 0;
  int _selectedTabIndex = 0;
  bool _isStarred = false;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeProvider,
      builder: (context, child) {
        ThemeHelper.updateSystemBrightness(MediaQuery.platformBrightnessOf(context));

        final isPositive = widget.change >= 0;
        final changeColor = isPositive ? ThemeHelper.success : ThemeHelper.error;
        final changePrefix = isPositive ? '+' : '';

        return CupertinoPageScaffold(
          backgroundColor: ThemeHelper.background,
          navigationBar: CupertinoNavigationBar(
            backgroundColor: ThemeHelper.background,
            border: Border(bottom: BorderSide(color: ThemeHelper.border, width: 0.5)),
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.of(context).maybePop(),
              child: AppDecorations.flexibleIconContainer(
                gradientColors: null,
                size: 36,
                borderRadius: 100,
                child: Icon(CupertinoIcons.back, color: ThemeHelper.textPrimary, size: 18)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _isStarred = !_isStarred;
                    });
                  },
                  child: AppDecorations.flexibleIconContainer(
                    gradientColors: null,
                    size: 36,
                    borderRadius: 100,
                    child: Icon(
                      _isStarred ? CupertinoIcons.star_fill : CupertinoIcons.star,
                      color: _isStarred ? CupertinoColors.systemYellow : ThemeHelper.textPrimary,
                      size: 18,
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Share.share(
                      'Check out ${widget.symbol} (${widget.companyName}) - Current price: \$${widget.price.toStringAsFixed(2)} (${widget.change >= 0 ? '+' : ''}${widget.changePercent.toStringAsFixed(2)}%)',
                      subject: '${widget.symbol} Stock Information',
                    );
                  },
                  child: AppDecorations.flexibleIconContainer(
                    gradientColors: null,
                    size: 36,
                    borderRadius: 100,
                    child: Icon(CupertinoIcons.share, color: ThemeHelper.textPrimary, size: 18),
                  ),
                ),
              ],
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM, vertical: AppConstants.paddingM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StockHeaderWidget(
                          companyName: widget.companyName,
                          symbol: widget.symbol,
                          market: widget.market,
                        ),
                        const SizedBox(height: 12),
                        // _buildInvestorBanner(),
                        const SizedBox(height: 16),
                        PriceSectionWidget(
                          price: widget.price,
                          change: widget.change,
                          changePercent: widget.changePercent,
                          changeColor: changeColor,
                          changePrefix: changePrefix,
                        ),
                        const SizedBox(height: 12),
                        TimeRangeTabsWidget(
                          selectedIndex: _selectedTimeIndex,
                          onIndexChanged: (index) => setState(() => _selectedTimeIndex = index),
                        ),
                        const SizedBox(height: 16),
                        TabSwitchWidget(
                          selectedIndex: _selectedTabIndex,
                          onIndexChanged: (index) => setState(() => _selectedTabIndex = index),
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        if (_selectedTabIndex == 0) ...[
                          const NewsCardWidget(),
                          const SizedBox(height: AppConstants.paddingM),
                          const KeyStatsWidget(),
                          const SizedBox(height: AppConstants.paddingM),
                          const EarningsSectionWidget(),
                          const SizedBox(height: AppConstants.paddingM),
                          const TechnicalsSectionWidget(),
                          const SizedBox(height: AppConstants.paddingM),
                          const AnalystRatingWidget(),
                          const SizedBox(height: AppConstants.paddingM),
                          const EmployeesSectionWidget(),
                          const SizedBox(height: AppConstants.paddingM),
                          const AboutSectionWidget(),
                          const SizedBox(height: AppConstants.paddingXL),
                        ] else ...[
                          _buildNewsList(),
                          const SizedBox(height: 80),
                        ],
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

  Widget _buildNewsList() {
    return Column(
      children: List.generate(
        6,
        (i) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: NewsCardWidget(),
        ),
      ),
    );
  }
}
