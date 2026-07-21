import 'package:flutter/widgets.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

void handleBottomNavTap(BuildContext context, int index) {
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


