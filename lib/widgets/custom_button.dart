import 'package:flutter/material.dart';

// --- Sekarang ini adalah sebuah fungsi yang mengembalikan Widget ---
Widget customButton({
  required String text,
  required VoidCallback onPressed,
  Color color = Colors.blue, // Default color
  double width = double.infinity, // Ubah default width menjadi infinity agar mengisi lebar
  double height = 50.0,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white), // Gunakan const untuk TextStyle
      ),
    ),
  );
}