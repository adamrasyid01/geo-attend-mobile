import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.cursorColor = const Color(0xFF2E72FF),
    this.iconColor = const Color(0xFF777777),
    this.borderColor = const Color(0xFFE8E8E8),
    this.fillColor,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final Color cursorColor;
  final Color iconColor;
  final Color borderColor;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: cursorColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppConstants.regular15.copyWith(color: iconColor),
        prefixIcon: Icon(Icons.search_rounded, color: iconColor),
        filled: true,
        fillColor: fillColor ?? AppConstants.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cursorColor),
        ),
      ),
    );
  }
}
