import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';

Widget customSelect({
  required String label,
  required String hintText,
  required List<String> items,
  required String? value,
  required ValueChanged<String?> onChanged,
  FormFieldValidator<String>? validator,
  double width = double.infinity,
  bool showLabel = true,
  Color? fillColor,
  Color? borderColor,
  Color? focusedBorderColor,
  BorderRadius? borderRadius,
  EdgeInsetsGeometry? contentPadding,
  TextStyle? textStyle,
  TextStyle? hintStyle,
  Widget? icon,
  EdgeInsetsGeometry? itemPadding,
}) {
  final fieldBorderRadius = borderRadius ?? BorderRadius.circular(10);
  final fieldBorderColor = borderColor ?? AppConstants.gray500;

  OutlineInputBorder border([Color? color, double width = 1]) {
    return OutlineInputBorder(
      borderRadius: fieldBorderRadius,
      borderSide: BorderSide(color: color ?? fieldBorderColor, width: width),
    );
  }

  return SizedBox(
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(label, style: AppConstants.medium14),
          const SizedBox(height: 8),
        ],
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                hintStyle ?? AppConstants.regular15.copyWith(color: Colors.grey),
            fillColor: fillColor ?? AppConstants.textField.withValues(alpha: 0.05),
            filled: true,
            isDense: true,
            contentPadding: contentPadding,
            border: border(),
            enabledBorder: border(),
            focusedBorder: border(focusedBorderColor ?? fieldBorderColor),
            errorBorder: border(Colors.red.shade700),
            focusedErrorBorder: border(Colors.red.shade700, 1.5),
          ),
          isExpanded: true,
          icon: icon,
          style: textStyle ?? AppConstants.regular15,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: itemPadding ?? const EdgeInsets.symmetric(horizontal: 8),
                child: Text(item, overflow: TextOverflow.ellipsis),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    ),
  );
}
