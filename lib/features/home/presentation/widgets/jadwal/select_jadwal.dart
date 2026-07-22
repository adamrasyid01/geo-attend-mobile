import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/widgets/custom_select.dart';

class SelectJadwal extends StatelessWidget {
  const SelectJadwal({
    super.key,
    required this.monthNames,
    required this.selectedMonth,
    required this.selectedYear,
    required this.yearOptions,
    required this.onMonthChanged,
    required this.onYearChanged,
  });

  final List<String> monthNames;
  final int selectedMonth;
  final int selectedYear;
  final List<int> yearOptions;
  final ValueChanged<int> onMonthChanged;
  final ValueChanged<int> onYearChanged;

  @override
  Widget build(BuildContext context) {
    final selectedMonthName = monthNames[selectedMonth - 1];
    final yearItems = yearOptions.map((year) => year.toString()).toList();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppConstants.softBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.calendar_month_rounded,
              color: Color(0xFF2E72FF),
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: customSelect(
                    label: 'Bulan',
                    showLabel: false,
                    hintText: 'Bulan',
                    items: monthNames,
                    value: selectedMonthName,
                    fillColor: AppConstants.softBlue.withValues(alpha: 0.45),
                    borderColor: Colors.transparent,
                    focusedBorderColor: AppConstants.primaryBlue,
                    borderRadius: BorderRadius.circular(12),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 11,
                    ),
                    textStyle: AppConstants.semibold14,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF2E72FF),
                    ),
                    itemPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      if (value == null) return;
                      onMonthChanged(monthNames.indexOf(value) + 1);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: customSelect(
                    label: 'Tahun',
                    showLabel: false,
                    hintText: 'Tahun',
                    items: yearItems,
                    value: selectedYear.toString(),
                    fillColor: AppConstants.softBlue.withValues(alpha: 0.45),
                    borderColor: Colors.transparent,
                    focusedBorderColor: AppConstants.primaryBlue,
                    borderRadius: BorderRadius.circular(12),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 11,
                    ),
                    textStyle: AppConstants.semibold14,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF2E72FF),
                    ),
                    itemPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      final year = int.tryParse(value ?? '');
                      if (year == null) return;
                      onYearChanged(year);
                    },
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

