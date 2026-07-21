import 'package:flutter/material.dart';

class StaffItem {
  const StaffItem({
    required this.name,
    required this.role,
    required this.code,
    required this.color,
  });

  final String name;
  final String role;
  final String code;
  final Color color;
}
