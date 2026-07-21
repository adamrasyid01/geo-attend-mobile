import 'package:flutter/material.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_card.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_item.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_summary.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    const notifications = [
      InboxItem(
        title: 'Presensi masuk berhasil',
        message: 'Check in kamu hari ini berhasil tercatat pukul 08.55.08.',
        time: 'Baru saja',
        type: InboxItemType.success,
        isUnread: true,
      ),
      InboxItem(
        title: 'Pengajuan izin diproses',
        message: 'Pengajuan izin kamu sedang menunggu persetujuan atasan.',
        time: '10 menit lalu',
        type: InboxItemType.info,
        isUnread: true,
      ),
      InboxItem(
        title: 'Jadwal kerja besok',
        message: 'Jadwal kerja Jumat, 29 Agustus 2025 adalah 09.00 - 18.00.',
        time: '1 jam lalu',
        type: InboxItemType.schedule,
      ),
      InboxItem(
        title: 'Presensi pulang belum tercatat',
        message: 'Jangan lupa melakukan check out sebelum jam kerja selesai.',
        time: 'Kemarin',
        type: InboxItemType.warning,
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 126),
      itemCount: notifications.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const InboxSummary(
            icon: Icons.notifications_active_rounded,
            title: '2 notifikasi baru',
            description: 'Pantau update presensi dan pengajuan kamu di sini.',
          );
        }

        return InboxCard(item: notifications[index - 1]);
      },
    );
  }
}

