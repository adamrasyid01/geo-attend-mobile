import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/widgets/custom_button.dart';
import 'package:geo_attend/widgets/custom_navbar.dart';
import 'package:go_router/go_router.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppConstants.white,
      extendBody: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selamat Datang', style: AppConstants.medium18),
                      Text('Adam Gantenk', style: AppConstants.bold24),
                      Text(
                        '001xl - Front End Developer',
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
            const SizedBox(height: 24),

            // Dua kotak putih
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWhiteCard(
                  context,
                  icon: 'finger_tap.svg',
                  label: 'Absen Masuk',
                  color: AppConstants.warning500,
                  onTap: () => context.push(AppRoutes.takePhoto),
                ),
                _buildWhiteCard(
                  context,
                  icon: 'izin.svg',
                  label: 'Izin / Cuti',
                  color: AppConstants.error500,
                  onTap: () => context.push(AppRoutes.izin),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Jadwal Kerja
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppConstants.warning500),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.black.withValues(alpha: 0.25),
                    blurRadius: 80,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jadwal Kerja', style: AppConstants.bold20),
                  Text('08:00 - 16.00', style: AppConstants.medium18),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(child: Text('13:20:11', style: AppConstants.medium24)),
            const SizedBox(height: 16),

            // Tombol Absen Masuk besar
            customButton(
              text: 'Absen Masuk',
              onPressed: () => context.push(AppRoutes.takePhoto),
              color: AppConstants.warning500,
              height: 56,
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Senin, 01 Januari 2023',
                style: AppConstants.medium18.copyWith(
                  color: AppConstants.gray500,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {},
      ),
    );
  }

  Widget _buildWhiteCard(
    BuildContext context, {
    required String icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    final width = (MediaQuery.sizeOf(context).width - 40 - 16) / 2;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
          color: AppConstants.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppConstants.gray500.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: AppConstants.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              '${AppConstants.iconPath}/$icon',
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              width: 40,
              height: 40,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppConstants.medium14.copyWith(color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
