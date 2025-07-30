import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart'; // Pastikan path ini benar

// --- Sekarang ini adalah sebuah fungsi yang mengembalikan Widget ---
Widget customSelect({
  required String label,
  required String hintText,
  required List<String> items,
  required String? value, // Nilai yang dipilih (dari parent)
  required ValueChanged<String?> onChanged, // Callback ke parent saat nilai berubah
  FormFieldValidator<String>? validator, // Validator dari parent
  double width = double.infinity, // Properti width tidak selalu relevan untuk DropdownButtonFormField
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppConstants.medium14),
      const SizedBox(height: 8),
      DropdownButtonFormField<String>(
        value: value, // Gunakan nilai dari properti
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppConstants.regular15.copyWith(color: Colors.grey),
          fillColor: AppConstants.textField.withOpacity(0.05),
          filled: true,
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
            borderSide: BorderSide(color: AppConstants.gray500),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red.shade700),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red.shade700, width: 1.5),
          ),
        ),
        // Pastikan iconSize dan isExpanded diatur jika perlu
        // icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        isExpanded: true, // Agar dropdown mengisi lebar yang tersedia

        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Padding( // Tambahkan padding ke DropdownMenuItem jika diinginkan
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(item),
            ),
          );
        }).toList(),

        onChanged: onChanged, // Gunakan callback onChanged dari properti
        validator: validator, // Gunakan validator dari properti
      ),
    ],
  );
}