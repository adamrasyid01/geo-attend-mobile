import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_jadwal_state.dart';

class SelectJadwalCubit extends Cubit<SelectJadwalState> {
  SelectJadwalCubit({DateTime? initialDate})
      : super(_initialState(initialDate ?? DateTime.now()));

  static const List<String> monthNames = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  static const List<String> shortDayNames = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];

  static const List<String> dayNames = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  static SelectJadwalState _initialState(DateTime initialDate) {
    final today = DateTime(
      initialDate.year,
      initialDate.month,
      initialDate.day,
    );

    return SelectJadwalState(
      today: today,
      selectedDate: today,
      selectedMonth: today.month,
      selectedYear: today.year,
      yearOptions: List.generate(11, (index) => today.year - 5 + index),
    );
  }

  void selectMonth(int month) {
    if (month == state.selectedMonth) return;

    emit(
      state.copyWith(
        selectedMonth: month,
        selectedDate: _dateForDisplayedMonth(state.selectedYear, month),
      ),
    );
  }

  void selectYear(int year) {
    if (year == state.selectedYear) return;

    emit(
      state.copyWith(
        selectedYear: year,
        selectedDate: _dateForDisplayedMonth(year, state.selectedMonth),
      ),
    );
  }

  void selectDate(DateTime date) {
    emit(
      state.copyWith(
        selectedDate: date,
        selectedMonth: date.month,
        selectedYear: date.year,
      ),
    );
  }

  List<DateTime?> calendarDates(int year, int month) {
    final firstDate = DateTime(year, month);
    final totalDays = DateTime(year, month + 1, 0).day;
    final leadingEmptyDays = firstDate.weekday - 1;
    final totalCells = weekRowsInMonth(year, month) * 7;

    return List.generate(totalCells, (index) {
      final day = index - leadingEmptyDays + 1;

      if (day < 1 || day > totalDays) return null;
      return DateTime(year, month, day);
    });
  }

  int weekRowsInMonth(int year, int month) {
    final firstDate = DateTime(year, month);
    final totalDays = DateTime(year, month + 1, 0).day;
    final leadingEmptyDays = firstDate.weekday - 1;

    return math.max(1, ((leadingEmptyDays + totalDays) / 7).ceil());
  }

  bool isSameDay(DateTime firstDate, DateTime secondDate) {
    return firstDate.year == secondDate.year &&
        firstDate.month == secondDate.month &&
        firstDate.day == secondDate.day;
  }

  bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  DateTime _dateForDisplayedMonth(int year, int month) {
    final isCurrentMonth = year == state.today.year && month == state.today.month;
    final preferredDay = isCurrentMonth ? state.today.day : state.selectedDate.day;
    final lastDay = DateTime(year, month + 1, 0).day;

    return DateTime(year, month, math.min(preferredDay, lastDay));
  }
}

