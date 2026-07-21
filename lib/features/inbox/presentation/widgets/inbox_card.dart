import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_item.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_page_colors.dart';

class InboxCard extends StatelessWidget {
  const InboxCard({super.key, required this.item});

  final InboxItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color:
              item.isUnread
                  ? InboxPageColors.primaryBlue
                  : InboxPageColors.borderColor,
          width: item.isUnread ? 1.2 : 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InboxIcon(type: item.type),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: AppConstants.semibold14.copyWith(
                          color: const Color(0xFF252525),
                        ),
                      ),
                    ),
                    if (item.isUnread) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(top: 6),
                        decoration: const BoxDecoration(
                          color: InboxPageColors.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  item.message,
                  style: AppConstants.regular15.copyWith(
                    color: InboxPageColors.textMuted,
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.time,
                  style: AppConstants.medium14.copyWith(
                    color: InboxPageColors.primaryBlue,
                    fontSize: 12,
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

class _InboxIcon extends StatelessWidget {
  const _InboxIcon({required this.type});

  final InboxItemType type;

  @override
  Widget build(BuildContext context) {
    final color = switch (type) {
      InboxItemType.success => InboxPageColors.green,
      InboxItemType.info => InboxPageColors.primaryBlue,
      InboxItemType.schedule => InboxPageColors.orange,
      InboxItemType.warning => InboxPageColors.red,
    };

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(type.icon, color: color, size: 24),
    );
  }
}

