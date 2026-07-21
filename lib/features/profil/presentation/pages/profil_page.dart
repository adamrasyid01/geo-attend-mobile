import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/profil/presentation/widgets/profile_header.dart';
import 'package:geo_attend/features/profil/presentation/widgets/profile_menu_item.dart';
import 'package:geo_attend/features/profil/presentation/widgets/profile_page_colors.dart';
import 'package:geo_attend/features/profil/presentation/widgets/profile_section.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProfilePageColors.pageBackground,
      appBar: AppBar(
        title: Text('Profile', style: AppConstants.semibold20),
        centerTitle: true,
        backgroundColor: AppConstants.white,
        surfaceTintColor: AppConstants.white,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 126),
          children: [
            ProfileHeader(),
            SizedBox(height: 18),
            ProfileSection(
              title: 'My Info',
              items: [
                ProfileMenuItem(
                  icon: Icons.person_outline_rounded,
                  title: 'Personal Info',
                ),
                ProfileMenuItem(
                  icon: Icons.badge_outlined,
                  title: 'Employment Info',
                ),
                ProfileMenuItem(
                  icon: Icons.school_outlined,
                  title: 'Education and Experience',
                ),
                ProfileMenuItem(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Payroll Info',
                ),
              ],
            ),
            SizedBox(height: 18),
            ProfileSection(
              title: 'Settings',
              items: [
                ProfileMenuItem(
                  icon: Icons.lock_outline_rounded,
                  title: 'Change Password',
                ),
                ProfileMenuItem(icon: Icons.pin_outlined, title: 'PIN'),
                ProfileMenuItem(
                  icon: Icons.logout_rounded,
                  title: 'Logout',
                  isDanger: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
