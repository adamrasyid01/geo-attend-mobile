import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Text('Profil', style: AppConstants.semibold20),
        centerTitle: true,
        backgroundColor: AppConstants.white,
        surfaceTintColor: AppConstants.white,
        elevation: 0,
      ),
      body: Center(child: Text('Profil', style: AppConstants.semibold20)),
    );
  }
}
