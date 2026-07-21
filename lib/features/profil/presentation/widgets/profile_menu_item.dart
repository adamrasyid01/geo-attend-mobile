import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/profil/presentation/widgets/profile_page_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.isDanger = false,
  });

  final IconData icon;
  final String title;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? ProfilePageColors.dangerRed : ProfilePageColors.primaryBlue;
    final textColor = isDanger ? ProfilePageColors.dangerRed : const Color(0xFF252525);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppConstants.medium14.copyWith(color: textColor),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color:
                  isDanger
                      ? ProfilePageColors.dangerRed
                      : ProfilePageColors.textMuted,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
