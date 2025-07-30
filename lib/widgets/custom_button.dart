import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';

// --- Sekarang ini adalah sebuah fungsi yang mengembalikan Widget ---
Widget customButton({
  required String text,
  required VoidCallback onPressed,
  Color? color, // Default color
  double width = double.infinity,
  double height = 50.0,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppConstants.semibold18.copyWith(
          color: Colors.white,
        ), // Gunakan const untuk TextStyle
      ),
    ),
  );
}
