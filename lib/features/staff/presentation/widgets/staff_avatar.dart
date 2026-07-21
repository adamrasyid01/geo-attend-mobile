import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_item.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_page_colors.dart';

class StaffAvatar extends StatelessWidget {
  const StaffAvatar({super.key, required this.item});

  final StaffItem item;

  @override
  Widget build(BuildContext context) {
    final initials = item.name
        .split(' ')
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0])
        .join();

    return CircleAvatar(
      radius: 28,
      backgroundColor: item.color,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.person_rounded,
            color: StaffPageColors.primaryBlue.withValues(alpha: 0.18),
            size: 38,
          ),
          Text(
            initials,
            style: AppConstants.semibold18.copyWith(
              color: StaffPageColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
