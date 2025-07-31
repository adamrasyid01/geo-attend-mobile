import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart'; // Pastikan path ini benar

Widget customTextfield({
  TextEditingController? inputController,
  required String label,
  TextInputType? keyboardType,
  required String hintText,
  required Color cursorColor,
  double width = double.infinity,
  void Function(String)? onChanged,
  FormFieldValidator<String>? validator,
  String? initialValue,
  Widget? suffixIcon, // Tambahkan properti untuk ikon suffix

  bool obscureText = false, // State visibilitas password dari parent
  String obscureCharacter = '*',
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: AppConstants.medium14,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 8),
      TextFormField(
        initialValue: initialValue,
        maxLines: 1, // Batasi maxLines untuk password field
        cursorColor: cursorColor,
        onChanged: onChanged,
        controller: inputController,
        keyboardType: keyboardType,
        obscureText: obscureText, // Gunakan properti obscureText dari parent
        obscuringCharacter: obscureCharacter,
        decoration: InputDecoration(
          fillColor: AppConstants.textField.withOpacity(0.05),
          filled: true,
          hintText: hintText,
          hintStyle: AppConstants.regular15.copyWith(color: Colors.grey),
          suffixIcon:suffixIcon,
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
        ),
        validator: validator, // Gunakan validator dari properti
      ),
    ],
  );
}