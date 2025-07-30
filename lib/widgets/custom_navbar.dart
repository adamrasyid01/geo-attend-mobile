import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_attend/constants/app_constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: AppConstants.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppConstants.black.withOpacity(0.6),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildNavItem(context, 'finger_tap.svg', 'Absensi', 0),
            _buildNavItem(context, 'lembur.svg', 'Lembur', 1),
            _buildNavItem(context, 'laporan.svg', 'Laporan', 2),
            _buildNavItem(context, 'profile.svg', 'Profil', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String iconName,
    String label,
    int index,
  ) {
    final bool isSelected = selectedIndex == index;
    final Color iconColor =
        isSelected ? AppConstants.warning500 : AppConstants.gray500;
    final Color textColor =
        isSelected ? AppConstants.warning500 : AppConstants.gray500;

    return Expanded(
      child: InkWell(
        onTap: () => onItemTapped(index),
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              '${AppConstants.iconPath}/$iconName',
              // ignore: deprecated_member_use
              color: iconColor,
              width: 32,
              height: 32,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppConstants.medium14.copyWith(
                color: textColor,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
