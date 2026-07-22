import 'package:geo_attend/pages/main_navigation_page.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'route_pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: RoutePages.splashScreen),
    GoRoute(path: AppRoutes.login, builder: RoutePages.login),
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigationPage(
          selectedIndex: _bottomNavIndexFromPath(state.uri.path),
          child: child,
        );
      },
      routes: [
        GoRoute(path: AppRoutes.beranda, builder: RoutePages.beranda),
        GoRoute(path: AppRoutes.notifikasi, builder: RoutePages.notifikasi),
        GoRoute(path: AppRoutes.presensi, builder: RoutePages.presensi),
        GoRoute(path: AppRoutes.staff, builder: RoutePages.staff),
        GoRoute(path: AppRoutes.profil, builder: RoutePages.profil),
      ],
    ),
    GoRoute(path: AppRoutes.absensi, builder: RoutePages.absensi),
    GoRoute(path: AppRoutes.takePhoto, builder: RoutePages.takePhoto),
    GoRoute(path: AppRoutes.izin, builder: RoutePages.izin),
    GoRoute(path: AppRoutes.history, builder: RoutePages.history),
    GoRoute(path: AppRoutes.jadwal, builder: RoutePages.jadwal),
  ],
);

int _bottomNavIndexFromPath(String path) {
  return switch (path) {
    AppRoutes.notifikasi => 1,
    AppRoutes.presensi => 2,
    AppRoutes.staff => 3,
    AppRoutes.profil => 4,
    _ => 0,
  };
}


