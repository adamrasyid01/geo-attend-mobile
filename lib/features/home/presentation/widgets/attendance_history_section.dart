import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/home/presentation/widgets/home_page_colors.dart';

class AttendanceHistorySection extends StatelessWidget {
  const AttendanceHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 18, 26),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Riwayat Kehadiran',
                  style: AppConstants.semibold14,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Semua',
                        style: AppConstants.medium14.copyWith(
                          color: const Color(0xFF2E72FF),
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Icon(
                        Icons.play_arrow_rounded,
                        color: Color(0xFF2E72FF),
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _HistoryCard(day: 'Senin', date: '26 Agustus 2025'),
          const SizedBox(height: 14),
          const _HistoryCard(day: 'Jumat', date: '23 Agustus 2025'),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.day, required this.date});

  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: HomePageColors.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: AppConstants.semibold14.copyWith(
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    date,
                    maxLines: 1,
                    style: AppConstants.regular15.copyWith(
                      color: const Color(0xFF777777),
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 54,
            color: HomePageColors.borderColor,
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),
          const Expanded(
            flex: 10,
            child: _HistoryTime(
              icon: Icons.login_rounded,
              iconColor: HomePageColors.orange,
              label: 'Check in',
              time: '08.59.18',
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            flex: 10,
            child: _HistoryTime(
              icon: Icons.logout_rounded,
              iconColor: HomePageColors.red,
              label: 'Check out',
              time: '18.34.09',
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryTime extends StatelessWidget {
  const _HistoryTime({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 16),
            const SizedBox(width: 4),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  maxLines: 1,
                  style: AppConstants.medium10.copyWith(
                    color: const Color(0xFF777777),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: AppConstants.semibold14.copyWith(
            color: const Color(0xFF2B2B2B),
          ),
        ),
      ],
    );
  }
}
