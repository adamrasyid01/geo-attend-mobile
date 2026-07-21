import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:go_router/go_router.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selamat Datang
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selamat Datang", style: AppConstants.medium18),
                      Text("Mr Adam Gantenk", style: AppConstants.bold24),
                      Text(
                        "001xl - Front End Developer",
                        style: AppConstants.medium14,
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange.shade100,
                  child: Icon(Icons.waving_hand_rounded, color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Jadwal Kerja
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppConstants.warning500),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppConstants.black.withOpacity(0.25),
                    blurRadius: 80,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jadwal Kerja", style: AppConstants.bold20),
                  Text("08:00 - 16.00", style: AppConstants.medium18),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Jam Digital
            Center(child: Text("13:20:11", style: AppConstants.medium24)),
            const SizedBox(height: 16),

            // Tombol Absen Masuk
            Center(
              child: GestureDetector(
                onTap: () {
                  // TODO: Aksi saat tombol ditekan
                  context.push(AppRoutes.takePhoto);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppConstants.warning500,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        '${AppConstants.iconPath}/finger_tap.svg',
                        width: 100,
                        color: AppConstants.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Absen Masuk",
                        style: AppConstants.medium18.copyWith(
                          color: AppConstants.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Tanggal
            Center(
              child: Text(
                "Senin, 01 Januari 2023",
                style: AppConstants.medium18.copyWith(
                  color: AppConstants.gray500,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Menu cepat
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShortcutButton(
                  'izin.svg',
                  "Izin /Cuti",
                  AppConstants.error500,
                  () => context.push(AppRoutes.izin),
                ),
                _buildShortcutButton(
                  'history.svg',
                  "History Absensi",
                  AppConstants.warning500,
                  () => context.push(AppRoutes.history),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShortcutButton(
    String icon,
    String label,
    Color iconColor,
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 80, // diameter CircleAvatar (2 * radius)
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: AppConstants.gray500),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: SvgPicture.asset(
                '${AppConstants.iconPath}/$icon',
                color: iconColor,
                width: 32,
              ),
            ),
          ),

          const SizedBox(height: 4),
          Text(label, style: AppConstants.medium14),
        ],
      ),
    );
  }
}


