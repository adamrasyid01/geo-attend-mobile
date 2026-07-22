import 'package:flutter/material.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:geo_attend/widgets/custom_navbar.dart';
import 'package:go_router/go_router.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  final Widget child;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          context.go(AppRoutes.beranda);
          return false;
        }

        return true;
      },
      child: Scaffold(
        extendBody: true,
        body: child,
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: selectedIndex,
          onItemTapped: (index) => _onItemTapped(context, index),
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    final route = switch (index) {
      0 => AppRoutes.beranda,
      1 => AppRoutes.notifikasi,
      2 => AppRoutes.presensi,
      3 => AppRoutes.staff,
      4 => AppRoutes.profil,
      _ => AppRoutes.beranda,
    };

    context.go(route);
  }
}
