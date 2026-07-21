import 'package:flutter/material.dart';
import 'package:geo_attend/features/home/presentation/widgets/attendance_header.dart';
import 'package:geo_attend/features/home/presentation/widgets/attendance_history_section.dart';
import 'package:geo_attend/features/home/presentation/widgets/home_page_colors.dart';
import 'package:geo_attend/features/home/presentation/widgets/shortcut_grid.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomePageColors.pageBackground,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(26, 28, 26, 128),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AttendanceHeader(
                onCheckInTap: () => context.push(AppRoutes.takePhoto),
              ),
              const SizedBox(height: 24),
              const ShortcutGrid(),
              const SizedBox(height: 24),
              const AttendanceHistorySection(),
            ],
          ),
        ),
      ),
    );
  }
}
