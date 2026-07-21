import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  static const Color _activeBlue = Color(0xFF2E72FF);
  static const Color _mutedText = Color(0xFF666666);
  static const Color _navBorder = Color(0xFFE9E9E9);
  static const Color _presenceOrange = Color(0xFFFFA12B);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 16),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: _navBorder),
      ),
      child: Row(
        children: [
          _buildNavItem(Icons.home_rounded, 'Beranda', 0),
          _buildNavItem(Icons.notifications_none_rounded, 'Notifikasi', 1),
          _buildPresenceItem(),
          _buildNavItem(Icons.article_outlined, 'Pengumuman', 3),
          _buildNavItem(Icons.person_outline_rounded, 'Profil', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;
    final Color color = isSelected ? _activeBlue : _mutedText;

    return Expanded(
      child: InkWell(
        onTap: () => onItemTapped(index),
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  maxLines: 1,
                  style: AppConstants.medium14.copyWith(
                    color: color,
                    fontSize: 12,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPresenceItem() {
    return Expanded(
      child: InkWell(
        onTap: () => onItemTapped(2),
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: -32,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        color: _presenceOrange,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppConstants.white, width: 4),
                      ),
                      child: const Icon(
                        Icons.touch_app_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Presensi',
                      style: AppConstants.medium14.copyWith(
                        color: _mutedText,
                        fontSize: 12,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
