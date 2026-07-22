import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/home/presentation/bloc/calendar_cubit.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.monthCount,
    required this.datesForMonth,
    required this.shortDayNames,
    required this.selectedDate,
    required this.today,
    required this.isWeekend,
    required this.isSameDay,
    required this.onMonthChanged,
    required this.onDateSelected,
  });

  final int monthCount;
  final List<DateTime?> Function(int month) datesForMonth;
  final List<String> shortDayNames;
  final DateTime selectedDate;
  final DateTime today;
  final bool Function(DateTime date) isWeekend;
  final bool Function(DateTime firstDate, DateTime secondDate) isSameDay;
  final ValueChanged<int> onMonthChanged;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    final calendarCubit = context.read<CalendarCubit>();

    return PageView.builder(
      controller: calendarCubit.pageController,
      itemCount: monthCount,
      onPageChanged: (index) {
        final month = calendarCubit.resolveChangedMonth(index);
        if (month == null) return;
        onMonthChanged(month);
      },
      itemBuilder: (context, index) {
        return _MonthCalendarGrid(
          dates: datesForMonth(index + 1),
          shortDayNames: shortDayNames,
          selectedDate: selectedDate,
          today: today,
          isWeekend: isWeekend,
          isSameDay: isSameDay,
          onDateSelected: onDateSelected,
        );
      },
    );
  }
}

class _MonthCalendarGrid extends StatelessWidget {
  const _MonthCalendarGrid({
    required this.dates,
    required this.shortDayNames,
    required this.selectedDate,
    required this.today,
    required this.isWeekend,
    required this.isSameDay,
    required this.onDateSelected,
  });

  final List<DateTime?> dates;
  final List<String> shortDayNames;
  final DateTime selectedDate;
  final DateTime today;
  final bool Function(DateTime date) isWeekend;
  final bool Function(DateTime firstDate, DateTime secondDate) isSameDay;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 28,
            child: Row(
              children: [
                for (final dayName in shortDayNames)
                  Expanded(
                    child: Center(
                      child: Text(
                        dayName,
                        style: AppConstants.medium10.copyWith(
                          color: AppConstants.gray500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: dates.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisExtent: 54,
              ),
              itemBuilder: (context, index) {
                final date = dates[index];

                if (date == null) return const SizedBox.shrink();

                return _DateCell(
                  date: date,
                  isSelected: isSameDay(date, selectedDate),
                  isToday: isSameDay(date, today),
                  isWeekend: isWeekend(date),
                  onTap: () => onDateSelected(date),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DateCell extends StatelessWidget {
  const _DateCell({
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.isWeekend,
    required this.onTap,
  });

  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final bool isWeekend;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? AppConstants.primaryBlue : null;
    final textColor =
        isSelected
            ? AppConstants.white
            : isWeekend
            ? AppConstants.red
            : AppConstants.black;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isToday ? AppConstants.primaryBlue : Colors.transparent,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.day.toString(),
                style: AppConstants.semibold14.copyWith(color: textColor),
              ),
              const SizedBox(height: 1),
              Text(
                isToday ? 'Hari ini' : '',
                style: AppConstants.medium10.copyWith(
                  color:
                      isSelected
                          ? AppConstants.white
                          : AppConstants.primaryBlue,
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



