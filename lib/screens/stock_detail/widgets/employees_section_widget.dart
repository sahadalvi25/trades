import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';

class EmployeesSectionWidget extends StatelessWidget {
  final Map<String, String> employeeStats;

  const EmployeesSectionWidget({
    super.key,
    Map<String, String>? employeeStats,
  }) : employeeStats = employeeStats ?? const {
          'Employees (FY)': '125.66K',
          'Revenue / Employee (1Y)': '777.38K USD',
          'Net income / Employee (1Y)': '56.27K USD',
        };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeHelper.surfaceVariant,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(color: ThemeHelper.border, width: 1),
      ),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Employees', style: ThemeHelper.heading3),
          const SizedBox(height: 12),
          ...employeeStats.entries.map((entry) => _buildStatRow(entry.key, entry.value)),
        ],
      ),
    );
  }

  Widget _buildStatRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: ThemeHelper.caption.copyWith(color: ThemeHelper.textSecondary),
          ),
          Text(
            value,
            style: ThemeHelper.caption.copyWith(color: ThemeHelper.textPrimary),
          ),
        ],
      ),
    );
  }
}
