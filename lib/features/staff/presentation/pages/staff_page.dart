import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_card.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_item.dart';
import 'package:geo_attend/features/staff/presentation/widgets/staff_page_colors.dart';
import 'package:geo_attend/widgets/custom_searchfield.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  final TextEditingController _searchController = TextEditingController();
  String _keyword = '';

  static const List<StaffItem> _staffItems = [
    StaffItem(
      name: 'Adameve Guinevere',
      role: 'Frontend Developer',
      code: '001xl',
      color: Color(0xFFEAF3FF),
    ),
    StaffItem(
      name: 'Alyssa Maharani',
      role: 'UI Designer',
      code: '002ui',
      color: Color(0xFFFFF1D8),
    ),
    StaffItem(
      name: 'Bima Pratama',
      role: 'Backend Developer',
      code: '003be',
      color: Color(0xFFE7F8ED),
    ),
    StaffItem(
      name: 'Citra Lestari',
      role: 'HR Officer',
      code: '004hr',
      color: Color(0xFFFFE9EF),
    ),
    StaffItem(
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
      backgroundColor: StaffPageColors.pageBackground,
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

            return StaffCard(item: filteredStaff[index - 1]);
          },
        ),
      ),
    );
  }
}
