import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/widgets/custom_searchfield.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  static const Color _pageBackground = Color(0xFFF6F6F6);
  static const Color _primaryBlue = Color(0xFF2E72FF);
  static const Color _textMuted = Color(0xFF777777);
  static const Color _borderColor = Color(0xFFE8E8E8);

  final TextEditingController _searchController = TextEditingController();
  String _keyword = '';

  static const List<_StaffItem> _staffItems = [
    _StaffItem(
      name: 'Adameve Guinevere',
      role: 'Frontend Developer',
      code: '001xl',
      color: Color(0xFFEAF3FF),
    ),
    _StaffItem(
      name: 'Alyssa Maharani',
      role: 'UI Designer',
      code: '002ui',
      color: Color(0xFFFFF1D8),
    ),
    _StaffItem(
      name: 'Bima Pratama',
      role: 'Backend Developer',
      code: '003be',
      color: Color(0xFFE7F8ED),
    ),
    _StaffItem(
      name: 'Citra Lestari',
      role: 'HR Officer',
      code: '004hr',
      color: Color(0xFFFFE9EF),
    ),
    _StaffItem(
      name: 'Daffa Ramadhan',
      role: 'Mobile Developer',
      code: '005mb',
      color: Color(0xFFEDEBFF),
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredStaff =
        _staffItems.where((item) {
          final keyword = _keyword.toLowerCase();
          return item.name.toLowerCase().contains(keyword) ||
              item.role.toLowerCase().contains(keyword) ||
              item.code.toLowerCase().contains(keyword);
        }).toList();

    return Scaffold(
      backgroundColor: _pageBackground,
      appBar: AppBar(
        title: Text('Staff', style: AppConstants.semibold20),
        centerTitle: true,
        backgroundColor: AppConstants.white,
        surfaceTintColor: AppConstants.white,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 126),
          itemCount: filteredStaff.length + 1,
          separatorBuilder: (_, index) => SizedBox(height: index == 0 ? 18 : 12),
          itemBuilder: (context, index) {
            if (index == 0) {
              return CustomSearchField(
                controller: _searchController,
                hintText: 'Cari nama karyawan',
                onChanged: (value) => setState(() => _keyword = value),
              );
            }

            return _StaffCard(item: filteredStaff[index - 1]);
          },
        ),
      ),
    );
  }
}

class _StaffCard extends StatelessWidget {
  const _StaffCard({required this.item});

  final _StaffItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _StaffPageState._borderColor),
      ),
      child: Row(
        children: [
          _StaffAvatar(item: item),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.semibold18.copyWith(
                    color: const Color(0xFF252525),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.role,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.regular15.copyWith(
                    color: _StaffPageState._textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              item.code,
              style: AppConstants.medium14.copyWith(
                color: _StaffPageState._primaryBlue,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StaffAvatar extends StatelessWidget {
  const _StaffAvatar({required this.item});

  final _StaffItem item;

  @override
  Widget build(BuildContext context) {
    final initials = item.name
        .split(' ')
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0])
        .join();

    return CircleAvatar(
      radius: 28,
      backgroundColor: item.color,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.person_rounded,
            color: _StaffPageState._primaryBlue.withValues(alpha: 0.18),
            size: 38,
          ),
          Text(
            initials,
            style: AppConstants.semibold18.copyWith(
              color: _StaffPageState._primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}

class _StaffItem {
  const _StaffItem({
    required this.name,
    required this.role,
    required this.code,
    required this.color,
  });

  final String name;
  final String role;
  final String code;
  final Color color;
}

