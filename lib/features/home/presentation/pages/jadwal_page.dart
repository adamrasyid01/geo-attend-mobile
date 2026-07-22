import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/home/presentation/bloc/calendar_cubit.dart';
import 'package:geo_attend/features/home/presentation/bloc/select_jadwal_cubit.dart';
import 'package:geo_attend/features/home/presentation/widgets/jadwal/calendar.dart';
import 'package:geo_attend/features/home/presentation/widgets/jadwal/select_jadwal.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  static const double _calendarCellHeight = 54;
  static const double _weekdayHeaderHeight = 28;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectJadwalCubit, SelectJadwalState>(
      listenWhen: (previous, current) =>
          previous.selectedMonth != current.selectedMonth,
      listener: (context, state) {
        context.read<CalendarCubit>().syncSelectedMonth(state.selectedMonth);
      },
      builder: (context, state) {
        final cubit = context.read<SelectJadwalCubit>();
        final calendarRows = cubit.weekRowsInMonth(
          state.selectedYear,
          state.selectedMonth,
        );
        final calendarHeight =
            _weekdayHeaderHeight + (calendarRows * _calendarCellHeight);

        return Scaffold(
          backgroundColor: AppConstants.pageBackground,
          body: SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
              children: [
                SelectJadwal(
                  monthNames: SelectJadwalCubit.monthNames,
                  selectedMonth: state.selectedMonth,
                  selectedYear: state.selectedYear,
                  yearOptions: state.yearOptions,
                  onMonthChanged: cubit.selectMonth,
                  onYearChanged: cubit.selectYear,
                ),
                const SizedBox(height: 18),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  height: calendarHeight,
                  child: Calendar(
                    monthCount: SelectJadwalCubit.monthNames.length,
                    datesForMonth: (month) => cubit.calendarDates(
                      state.selectedYear,
                      month,
                    ),
                    shortDayNames: SelectJadwalCubit.shortDayNames,
                    selectedDate: state.selectedDate,
                    today: state.today,
                    isWeekend: cubit.isWeekend,
                    isSameDay: cubit.isSameDay,
                    onMonthChanged: cubit.selectMonth,
                    onDateSelected: cubit.selectDate,
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        );
      },
    );
  }
}


