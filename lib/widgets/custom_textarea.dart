import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart'; // Pastikan path ini benar

Widget customTextarea({
  required TextEditingController inputController,
  required String label,
  TextInputType? keyboardType = TextInputType.text,
  required String hintText,
  required Color cursorColor,
  double width = double.infinity, // Properti width tidak terlalu berguna di sini karena TextFormField sudah flexibel
  FormFieldValidator<String>? validator,

  // --- Properti untuk fitur password (harus dikelola di parent) ---
  required int maxLines,
  bool obscureText = false, // State visibilitas password dari parent
  VoidCallback? onToggleObscureText,
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
        maxLines: maxLines, // Batasi maxLines untuk password field
        cursorColor: cursorColor,
        controller: inputController,
        keyboardType: keyboardType,
        obscureText: obscureText, // Gunakan properti obscureText dari parent
        obscuringCharacter: obscureCharacter,
        decoration: InputDecoration(
          fillColor: AppConstants.textField.withOpacity(0.05),
          filled: true,
          hintText: hintText,
          hintStyle: AppConstants.regular15.copyWith(color: Colors.grey),
         
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