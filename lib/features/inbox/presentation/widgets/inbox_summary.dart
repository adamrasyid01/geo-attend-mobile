import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_page_colors.dart';

class InboxSummary extends StatelessWidget {
  const InboxSummary({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: InboxPageColors.softBlue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: InboxPageColors.primaryBlue, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppConstants.semibold18.copyWith(
                    color: const Color(0xFF222222),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: AppConstants.regular15.copyWith(
                    color: InboxPageColors.textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

