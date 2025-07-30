import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'route_pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: RoutePages.splashScreen),
    GoRoute(path: AppRoutes.login, builder: RoutePages.login),
    GoRoute(path: AppRoutes.home, builder: RoutePages.home),
    GoRoute(path: AppRoutes.absensi, builder: RoutePages.absensi),
    GoRoute(path: AppRoutes.takePhoto, builder: RoutePages.takePhoto),
    GoRoute(path: AppRoutes.izin, builder: RoutePages.izin),
    GoRoute(path: AppRoutes.history, builder: RoutePages.history),
  ],
);
