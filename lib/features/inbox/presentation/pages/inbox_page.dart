import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/announcement_tab.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/inbox_page_colors.dart';
import 'package:geo_attend/features/inbox/presentation/widgets/notification_tab.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      initialIndex: widget.initialIndex,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant InboxPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      _tabController.index = widget.initialIndex;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InboxPageColors.pageBackground,
      appBar: AppBar(
        title: Text('Inbox', style: AppConstants.semibold20),
        centerTitle: true,
        backgroundColor: AppConstants.white,
        surfaceTintColor: AppConstants.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: Container(
            height: 46,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppConstants.white,
                borderRadius: BorderRadius.circular(11),
              ),
              labelColor: InboxPageColors.primaryBlue,
              unselectedLabelColor: InboxPageColors.textMuted,
              labelStyle: AppConstants.semibold14,
              unselectedLabelStyle: AppConstants.medium14,
              tabs: const [Tab(text: 'Notifikasi'), Tab(text: 'Pengumuman')],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [NotificationTab(), AnnouncementTab()],
      ),
    );
  }
}

