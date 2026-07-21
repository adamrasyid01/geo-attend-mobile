import 'package:flutter/material.dart';

class InboxItem {
  const InboxItem({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    this.isUnread = false,
  });

  final String title;
  final String message;
  final String time;
  final InboxItemType type;
  final bool isUnread;
}

enum InboxItemType { success, info, schedule, warning }

extension InboxItemTypeIcon on InboxItemType {
  IconData get icon {
    return switch (this) {
      InboxItemType.success => Icons.check_circle_outline_rounded,
      InboxItemType.info => Icons.assignment_outlined,
      InboxItemType.schedule => Icons.calendar_month_rounded,
      InboxItemType.warning => Icons.error_outline_rounded,
    };
  }
}
