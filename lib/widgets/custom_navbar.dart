import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          _buildNavItem('home.svg', 'home_fill.svg', 'Home', 0),
          _buildNavItem('bell.svg', 'bell_fill.svg', 'Inbox', 1),
          _buildPresenceItem(),
          _buildNavItem('staff.svg', 'staff_fill.svg', 'Staff', 3),
          _buildNavItem('user.svg', 'user_fill.svg', 'Profile', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    String icon,
    String activeIcon,
    String label,
    int index,
  ) {
    final bool isSelected = selectedIndex == index;
    final Color color = isSelected ? _activeBlue : _mutedText;
    final String iconAsset = isSelected ? activeIcon : icon;

    return Expanded(
      child: InkWell(
        onTap: () => onItemTapped(index),
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                '${AppConstants.iconPath}/$iconAsset',
                width: 30,
                height: 30,
              ),
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
                      child: Center(
                        child: SvgPicture.asset(
                          '${AppConstants.iconPath}/finger_tap.svg',
                          width: 36,
                          height: 36,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
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
