import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';

Widget customDatepicker({
  required TextEditingController controller,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  String hintText = 'DD/MM/YYYY',
  String label = 'Tanggal',
  required ValueChanged<DateTime?> onDateSelected,
  FormFieldValidator<String>? validator,
  bool enabled = true,
  IconData? suffixIcon,
}) {
  Future<void> selectDate(BuildContext context) async {
    if (!enabled) return; 
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(), // Gunakan initialDate dari props atau default
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onDateSelected.call(picked);
    } else {
      // Jika user membatalkan, panggil callback dengan null
      onDateSelected.call(null);
    }
  }

  return Builder(
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppConstants.medium14),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            readOnly: true,
            enabled: enabled,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppConstants.gray500),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppConstants.gray500),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppConstants.gray500,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(suffixIcon ?? Icons.calendar_today),
                onPressed: () => selectDate(context), // Panggil fungsi baru
                color: enabled ? null : Colors.grey,
              ),
            ),
            validator: validator,
            onTap: () => selectDate(context), // Panggil fungsi baru
          ),
        ],
      );
    },
  );
}