import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/home/presentation/widgets/home_page_colors.dart';

class ShortcutGrid extends StatelessWidget {
  const ShortcutGrid({super.key});

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
                color: HomePageColors.softBlue,
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
