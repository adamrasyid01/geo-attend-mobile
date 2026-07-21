import 'package:flutter/material.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_card.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_item.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_summary.dart';

class AnnouncementTab extends StatelessWidget {
  const AnnouncementTab({super.key});

  @override
  Widget build(BuildContext context) {
    const announcements = [
      InboxItem(
        title: 'Maintenance sistem absensi',
        message: 'Sistem akan mengalami maintenance pada Sabtu pukul 22.00.',
        time: 'Hari ini',
        type: InboxItemType.info,
        isUnread: true,
      ),
      InboxItem(
        title: 'Kebijakan cuti diperbarui',
        message:
            'Silakan cek ketentuan cuti terbaru sebelum membuat pengajuan.',
        time: 'Kemarin',
        type: InboxItemType.schedule,
      ),
      InboxItem(
        title: 'Pengingat kelengkapan profil',
        message: 'Pastikan data kontak dan jabatan kamu sudah sesuai.',
        time: '2 hari lalu',
        type: InboxItemType.success,
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 126),
      itemCount: announcements.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const InboxSummary(
            icon: Icons.campaign_rounded,
            title: '1 pengumuman baru',
            description:
                'Informasi perusahaan dan sistem absensi tampil di sini.',
          );
        }

        return InboxCard(item: announcements[index - 1]);
      },
    );
  }
}

