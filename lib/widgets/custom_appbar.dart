import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:go_router/go_router.dart'; // jika pakai go_router
// atau bisa juga gunakan Navigator.pop(context) jika tidak

AppBar customAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  Color? backgroundColor,
  Color titleColor = Colors.black,
  Color? dividerColor,
}) {
  return AppBar(
    title: Text(title, style: AppConstants.medium20),
    centerTitle: true,
    backgroundColor: backgroundColor ?? AppConstants.white,

    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: AppConstants.black),
      onPressed: () => context.pop(), // atau Navigator.pop(context)
    ),
    actions: actions,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(0.5),
      child: Divider(
        height: 1,
        thickness: 1,
        color: dividerColor ?? AppConstants.gray500.withOpacity(0.5),
      ),
    ),
  );
}
