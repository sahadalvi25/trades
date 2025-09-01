import 'package:flutter/cupertino.dart';
import 'package:trades/constants/app_constants.dart';
import 'package:trades/constants/theme_helper.dart';
import 'package:trades/constants/theme_provider.dart';

class CalendarView extends StatelessWidget {
  final ThemeProvider themeProvider;

  const CalendarView({
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
              // Calendar events grouped by date
              ..._buildCalendarEvents(),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildCalendarEvents() {
    // Mock calendar data based on the screenshot
    final List<CalendarEventGroup> eventGroups = [
      CalendarEventGroup(
        date: 'SUN, JUNE 07',
        events: [
          CalendarEvent(
            time: '23:00',
            title: 'Memorial Day',
            actual: 'Soon',
            forecast: '107.0',
            prior: '107.0',
            country: 'US',
            isImportant: true,
          ),
          CalendarEvent(
            time: '12:12',
            title: 'Memorial Day',
            actual: '',
            forecast: '',
            prior: '',
            country: 'US',
            isImportant: false,
          ),
        ],
      ),
      CalendarEventGroup(
        date: 'SAT, JUNE 06',
        events: [
          CalendarEvent(
            time: '23:00',
            title: 'Index Final',
            actual: 'Soon',
            forecast: '107.0',
            prior: '107.0',
            country: 'DE',
            isImportant: true,
          ),
        ],
      ),
      CalendarEventGroup(
        date: 'FRI, JUNE 05',
        events: [
          CalendarEvent(
            time: '23:00',
            title: 'Public Holiday',
            actual: '',
            forecast: '',
            prior: '',
            country: 'US',
            isImportant: false,
          ),
        ],
      ),
    ];

    return eventGroups.map((group) => _buildEventGroup(group)).toList();
  }

  Widget _buildEventGroup(CalendarEventGroup group) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date header
          Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.paddingM),
            child: Text(
              group.date,
              style: ThemeHelper.caption.copyWith(
                color: ThemeHelper.textSecondary,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.2,
              ),
            ),
          ),
          // Events for this date
          ...group.events.map((event) => _buildEventCard(event)),
        ],
      ),
    );
  }

  Widget _buildEventCard(CalendarEvent event) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
      padding: const EdgeInsets.all(AppConstants.paddingM),
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
          // Header row with time, title, and icons
          Row(
            children: [
              // Time
              if (event.isImportant)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: ThemeHelper.info,
                    shape: BoxShape.circle,
                  ),
                ),
              if (event.isImportant) const SizedBox(width: 8),
              Text(
                event.time,
                style: ThemeHelper.caption.copyWith(
                  color: ThemeHelper.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              // Country flag (simplified as text for now)
              Text(
                event.country,
                style: ThemeHelper.caption.copyWith(
                  color: ThemeHelper.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              // Dot separator
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: ThemeHelper.textSecondary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              // Bell icon
              Icon(
                CupertinoIcons.bell,
                size: 16,
                color: ThemeHelper.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingS),
          // Event title
          Text(
            event.title,
            style: ThemeHelper.body2.copyWith(
              color: ThemeHelper.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          // Event details row
          Row(
            children: [
              // Actual
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Actual:',
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                      ),
                    ),
                    Text(
                      event.actual.isEmpty ? '-' : event.actual,
                      style: ThemeHelper.caption.copyWith(
                        color: event.actual == 'Soon' ? ThemeHelper.error : ThemeHelper.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Forecast
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forecast:',
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                      ),
                    ),
                    Text(
                      event.forecast.isEmpty ? '-' : event.forecast,
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Prior
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prior:',
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textSecondary,
                      ),
                    ),
                    Text(
                      event.prior.isEmpty ? '-' : event.prior,
                      style: ThemeHelper.caption.copyWith(
                        color: ThemeHelper.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarEventGroup {
  final String date;
  final List<CalendarEvent> events;

  CalendarEventGroup({
    required this.date,
    required this.events,
  });
}

class CalendarEvent {
  final String time;
  final String title;
  final String actual;
  final String forecast;
  final String prior;
  final String country;
  final bool isImportant;

  CalendarEvent({
    required this.time,
    required this.title,
    required this.actual,
    required this.forecast,
    required this.prior,
    required this.country,
    required this.isImportant,
  });
}
