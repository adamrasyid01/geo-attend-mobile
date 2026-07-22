import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class MenuSquare extends StatelessWidget {
  const MenuSquare({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      _MenuItem(Icons.calendar_month_rounded, 'Jadwal', AppRoutes.jadwal),
      _MenuItem(Icons.assignment_rounded, 'Izin'),
      _MenuItem(Icons.beach_access_rounded, 'Cuti'),
      _MenuItem(Icons.work_history_rounded, 'Lembur'),
      _MenuItem(Icons.sick_rounded, 'Sakit'),
      _MenuItem(Icons.home_work_rounded, 'WFH'),
      _MenuItem(Icons.edit_note_rounded, 'Catatan'),
      _MenuItem(Icons.task_alt_rounded, 'Tugas'),
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
                SizedBox(width: itemWidth, child: _MenuTile(item: item)),
            ],
          );
        },
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem(this.icon, this.label, [this.route]);

  final IconData icon;
  final String label;
  final String? route;
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.item});

  final _MenuItem item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconBoxSize = constraints.maxWidth.clamp(44.0, 62.0).toDouble();
        final content = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: iconBoxSize,
              height: iconBoxSize,
              decoration: BoxDecoration(
                color: AppConstants.softBlue,
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

        if (item.route == null) return content;

        return InkWell(
          onTap: () => context.push(item.route!),
          borderRadius: BorderRadius.circular(14),
          child: content,
        );
      },
    );
  }
}


