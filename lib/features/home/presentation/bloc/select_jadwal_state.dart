part of 'select_jadwal_cubit.dart';

class SelectJadwalState extends Equatable {
  const SelectJadwalState({
    required this.today,
    required this.selectedDate,
    required this.selectedMonth,
    required this.selectedYear,
    required this.yearOptions,
  });

  final DateTime today;
  final DateTime selectedDate;
  final int selectedMonth;
  final int selectedYear;
  final List<int> yearOptions;

  String get selectedMonthName => SelectJadwalCubit.monthNames[selectedMonth - 1];
  String get selectedDayName => SelectJadwalCubit.dayNames[selectedDate.weekday - 1];

  SelectJadwalState copyWith({
    DateTime? today,
    DateTime? selectedDate,
    int? selectedMonth,
    int? selectedYear,
    List<int>? yearOptions,
  }) {
    return SelectJadwalState(
      today: today ?? this.today,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedYear: selectedYear ?? this.selectedYear,
      yearOptions: yearOptions ?? this.yearOptions,
    );
  }

  @override
  List<Object?> get props => [
        today,
        selectedDate,
        selectedMonth,
        selectedYear,
        yearOptions,
      ];
}


