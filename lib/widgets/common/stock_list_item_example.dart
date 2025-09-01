import 'package:flutter/cupertino.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/widgets/common/stock_list_item.dart';

/// Example widget demonstrating the usage of StockListItem with CustomImage
class StockListItemExample extends StatelessWidget {
  final ThemeProvider themeProvider;
  
  const StockListItemExample({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Stock List Examples'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppConstants.paddingM),
          children: [
            Text(
              'Stock List Items with Company Logos',
              style: ThemeHelper.heading2,
            ),
            const SizedBox(height: AppConstants.paddingM),
            
            // Stock with company logo
            StockListItem(
              symbol: 'AAPL',
              companyName: 'Apple Inc.',
              price: 150.25,
              change: '+2.15',
              changePercent: '+1.45%',
              isPositive: true,
              hasChart: true,
              themeProvider: themeProvider,
              companyLogoUrl: 'https://logo.clearbit.com/apple.com',
            ),
            
            // Stock with company logo
            StockListItem(
              symbol: 'GOOGL',
              companyName: 'Alphabet Inc.',
              price: 2850.75,
              change: '-15.30',
              changePercent: '-0.53%',
              isPositive: false,
              hasChart: true,
              themeProvider: themeProvider,
              companyLogoUrl: 'https://logo.clearbit.com/google.com',
            ),
            
            // Stock with company logo
            StockListItem(
              symbol: 'TSLA',
              companyName: 'Tesla Inc.',
              price: 245.80,
              change: '+8.45',
              changePercent: '+3.56%',
              isPositive: true,
              hasChart: true,
              themeProvider: themeProvider,
              companyLogoUrl: 'https://logo.clearbit.com/tesla.com',
            ),
            
            // Stock with company logo
            StockListItem(
              symbol: 'NVDA',
              companyName: 'NVIDIA Corporation',
              price: 485.90,
              change: '+12.75',
              changePercent: '+2.70%',
              isPositive: true,
              hasChart: true,
              themeProvider: themeProvider,
              companyLogoUrl: 'https://logo.clearbit.com/nvidia.com',
            ),
            
            // Stock without company logo (will show placeholder)
            StockListItem(
              symbol: 'MSFT',
              companyName: 'Microsoft Corporation',
              price: 380.45,
              change: '-5.20',
              changePercent: '-1.35%',
              isPositive: false,
              hasChart: true,
              themeProvider: themeProvider,
              // No companyLogoUrl - will show trades_logo.png as placeholder
            ),
            
            // Stock with invalid logo URL (will show placeholder)
            StockListItem(
              symbol: 'AMZN',
              companyName: 'Amazon.com Inc.',
              price: 145.30,
              change: '+3.15',
              changePercent: '+2.22%',
              isPositive: true,
              hasChart: true,
              themeProvider: themeProvider,
              companyLogoUrl: 'https://invalid-url-that-will-fail.com/logo.png',
            ),
            
            // Stock without chart
            StockListItem(
              symbol: 'META',
              companyName: 'Meta Platforms Inc.',
              price: 320.15,
              change: '+7.80',
              changePercent: '+2.50%',
              isPositive: true,
              hasChart: false,
              themeProvider: themeProvider,
              companyLogoUrl: 'https://logo.clearbit.com/meta.com',
            ),
          ],
        ),
      ),
    );
  }
}
