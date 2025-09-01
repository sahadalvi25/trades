import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class DailyNewsView extends StatelessWidget {
  final ThemeProvider themeProvider;

  const DailyNewsView({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingM),
          child: Column(
            children: [
              // News articles
              ..._buildNewsArticles(),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildNewsArticles() {
    // Mock news data based on the screenshot
    final List<NewsArticle> articles = [
      NewsArticle(
        ticker: 'AAPL',
        change: -0.30,
        timeAgo: '8 hours ago',
        imageUrl: 'assets/images/trades_logo.png', // Placeholder image
        headline: 'Amazon (AMZN) and Alphabet (GOOG) Are The Cheapest Trillion-Dollar Stocks Today',
        source: '24/7 Wall St.',
      ),
      NewsArticle(
        ticker: 'AAPL',
        change: -0.30,
        timeAgo: '8 hours ago',
        imageUrl: 'assets/images/trades_logo.png', // Placeholder image
        headline: 'Amazon (AMZN) and Alphabet (GOOG) Are The Cheapest Trillion-Dollar Stocks Today',
        source: '24/7 Wall St.',
      ),
    ];

    return articles.map((article) => _buildNewsCard(article)).toList();
  }

  Widget _buildNewsCard(NewsArticle article) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
      decoration: BoxDecoration(
        color: ThemeHelper.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(
          color: ThemeHelper.border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with ticker, change, and time
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side: ticker and change
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: ThemeHelper.textPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      article.ticker,
                      style: ThemeHelper.body2.copyWith(
                        color: ThemeHelper.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${article.change > 0 ? '+' : ''}${article.change.toStringAsFixed(2)}%',
                      style: ThemeHelper.caption.copyWith(
                        color: article.change >= 0 ? ThemeHelper.success : ThemeHelper.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                // Right side: time ago
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: ThemeHelper.info,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      article.timeAgo,
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // News image
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Image.asset(
              article.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: ThemeHelper.secondaryCardBackground,
                  child: Icon(
                    CupertinoIcons.photo,
                    size: 48,
                    color: ThemeHelper.textSecondary,
                  ),
                );
              },
            ),
          ),
          // Headline and source
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.headline,
                  style: ThemeHelper.body2.copyWith(
                    color: ThemeHelper.textPrimary,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingS),
                Text(
                  article.source,
                  style: ThemeHelper.caption.copyWith(
                    color: ThemeHelper.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsArticle {
  final String ticker;
  final double change;
  final String timeAgo;
  final String imageUrl;
  final String headline;
  final String source;

  NewsArticle({
    required this.ticker,
    required this.change,
    required this.timeAgo,
    required this.imageUrl,
    required this.headline,
    required this.source,
  });
}
