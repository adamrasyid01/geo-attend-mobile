import 'package:flutter/material.dart';
import 'package:geo_attend/features/absensi/presentation/pages/absensi_page.dart';
import 'package:geo_attend/widgets/custom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    AbsensiPage(),
    Center(child: Text('Halaman Lembur', style: TextStyle(fontSize: 24))),
    Center(child: Text('Halaman Laporan', style: TextStyle(fontSize: 24))),
    Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // navBar diatas body
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
