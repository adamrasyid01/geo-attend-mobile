import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  static const Color _primaryBlue = Color(0xFF1757D2);
  static const Color _softBlue = Color(0xFFD9E9FF);
  static const Color _pageBackground = Color(0xFFF6F6F6);
  static const Color _borderColor = Color(0xFFE8E8E8);
  static const Color _orange = Color(0xFFFF9F2D);
  static const Color _red = Color(0xFFFF5B5B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(26, 28, 26, 128),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AttendanceHeader(
                onCheckInTap: () => context.push(AppRoutes.takePhoto),
              ),
              const SizedBox(height: 24),
              const _ShortcutGrid(),
              const SizedBox(height: 24),
              const _AttendanceHistorySection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AttendanceHeader extends StatelessWidget {
  const _AttendanceHeader({required this.onCheckInTap});

  final VoidCallback onCheckInTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
      decoration: BoxDecoration(
        color: BerandaPage._primaryBlue,
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
                            color: BerandaPage._primaryBlue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '09.00 - 18.00',
                        style: AppConstants.medium14.copyWith(
                          color: BerandaPage._primaryBlue,
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
                            iconColor: BerandaPage._orange,
                            label: 'Check in',
                            time: '08.55.08',
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 42,
                        color: BerandaPage._borderColor,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      const Expanded(
                        child: _CheckStatus(
                          icon: Icons.logout_rounded,
                          iconColor: BerandaPage._red,
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

class _ShortcutGrid extends StatelessWidget {
  const _ShortcutGrid();

  @override
  Widget build(BuildContext context) {
    const items = [
      _ShortcutItem(Icons.calendar_month_rounded, 'Jadwal'),
      _ShortcutItem(Icons.assignment_rounded, 'Izin'),
      _ShortcutItem(Icons.beach_access_rounded, 'Cuti'),
      _ShortcutItem(Icons.work_history_rounded, 'Lembur'),
      _ShortcutItem(Icons.sick_rounded, 'Sakit'),
      _ShortcutItem(Icons.home_work_rounded, 'WFH'),
      _ShortcutItem(Icons.edit_note_rounded, 'Catatan'),
      _ShortcutItem(Icons.task_alt_rounded, 'Tugas'),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const crossAxisSpacing = 20.0;
          const itemPerRow = 4;
          final itemWidth =
              (constraints.maxWidth - (crossAxisSpacing * (itemPerRow - 1))) /
              itemPerRow;

          return Wrap(
            spacing: crossAxisSpacing,
            runSpacing: 16,
            children: [
              for (final item in items)
                SizedBox(width: itemWidth, child: _ShortcutTile(item: item)),
            ],
          );
        },
      ),
    );
  }
}

class _ShortcutItem {
  const _ShortcutItem(this.icon, this.label);

  final IconData icon;
  final String label;
}

class _ShortcutTile extends StatelessWidget {
  const _ShortcutTile({required this.item});

  final _ShortcutItem item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconBoxSize = constraints.maxWidth.clamp(44.0, 62.0).toDouble();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: iconBoxSize,
              height: iconBoxSize,
              decoration: BoxDecoration(
                color: BerandaPage._softBlue,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(item.icon, color: const Color(0xFF7DAEF8), size: 24),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                item.label,
                maxLines: 1,
                style: AppConstants.medium14.copyWith(
                  color: AppConstants.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AttendanceHistorySection extends StatelessWidget {
  const _AttendanceHistorySection();

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
        border: Border.all(color: BerandaPage._borderColor),
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
            color: BerandaPage._borderColor,
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),
          const Expanded(
            flex: 10,
            child: _HistoryTime(
              icon: Icons.login_rounded,
              iconColor: BerandaPage._orange,
              label: 'Check in',
              time: '08.59.18',
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            flex: 10,
            child: _HistoryTime(
              icon: Icons.logout_rounded,
              iconColor: BerandaPage._red,
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
