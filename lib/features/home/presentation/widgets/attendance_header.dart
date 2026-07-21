import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/home/presentation/widgets/home_page_colors.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key, required this.onCheckInTap});

  final VoidCallback onCheckInTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
      decoration: BoxDecoration(
        color: HomePageColors.primaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adameve Guinevere',
            style: AppConstants.bold24.copyWith(
              color: AppConstants.white,
              fontSize: 20,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '001xl - Frontend Developer',
            style: AppConstants.medium18.copyWith(
              color: AppConstants.white,
              fontSize: 16,
              height: 1,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: AppConstants.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Kamis, 28 Agustus 2025',
                          style: AppConstants.medium14.copyWith(
                            color: HomePageColors.primaryBlue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '09.00 - 18.00',
                        style: AppConstants.medium14.copyWith(
                          color: HomePageColors.primaryBlue,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: onCheckInTap,
                          child: const _CheckStatus(
                            icon: Icons.login_rounded,
                            iconColor: HomePageColors.orange,
                            label: 'Check in',
                            time: '08.55.08',
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 42,
                        color: HomePageColors.borderColor,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      const Expanded(
                        child: _CheckStatus(
                          icon: Icons.logout_rounded,
                          iconColor: HomePageColors.red,
                          label: 'Check out',
                          time: '-',
                        ),
                      ),
                    ],
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

class _CheckStatus extends StatelessWidget {
  const _CheckStatus({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.time,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 26),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppConstants.regular15.copyWith(
                  color: const Color(0xFF6B6B6B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: AppConstants.semibold14.copyWith(
                  color: const Color(0xFF2A2A2A),
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
