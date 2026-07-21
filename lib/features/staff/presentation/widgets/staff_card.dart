import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_avatar.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_item.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_page_colors.dart';

class StaffCard extends StatelessWidget {
  const StaffCard({super.key, required this.item});

  final StaffItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: StaffPageColors.borderColor),
      ),
      child: Row(
        children: [
          StaffAvatar(item: item),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.semibold18.copyWith(
                    color: const Color(0xFF252525),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.role,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.regular15.copyWith(
                    color: StaffPageColors.textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              item.code,
              style: AppConstants.medium14.copyWith(
                color: StaffPageColors.primaryBlue,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
