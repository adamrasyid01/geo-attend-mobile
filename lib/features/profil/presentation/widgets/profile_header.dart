import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/profil/presentation/widgets/profile_page_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              shape: BoxShape.circle,
              border: Border.all(color: ProfilePageColors.primaryBlue, width: 2),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.person_rounded,
                  color: ProfilePageColors.primaryBlue.withValues(alpha: 0.18),
                  size: 50,
                ),
                Text(
                  'AG',
                  style: AppConstants.semibold24.copyWith(
                    color: ProfilePageColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adameve Guinevere',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.semibold20.copyWith(
                    color: const Color(0xFF252525),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Frontend Developer',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.regular15.copyWith(
                    color: ProfilePageColors.textMuted,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'PT Geo Attend Indonesia',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppConstants.medium14.copyWith(
                      color: ProfilePageColors.primaryBlue,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
