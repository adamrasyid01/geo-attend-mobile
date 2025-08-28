import 'package:flutter/material.dart';
import 'package:geo_attend/features/absensi/presentation/pages/absensi_page.dart';
import 'package:geo_attend/features/absensi/presentation/pages/history_page.dart';
import 'package:geo_attend/features/absensi/presentation/pages/izin_page.dart';
import 'package:geo_attend/features/absensi/presentation/pages/take_photo_page.dart';
import 'package:geo_attend/features/auth/presentation/pages/login_page.dart';
import 'package:geo_attend/features/splash/presentation/pages/splash_screen.dart';
import 'package:geo_attend/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class RoutePages {
  static Widget splashScreen(BuildContext context, GoRouterState state) =>
      const SplashScreen();
  static Widget login(BuildContext context, GoRouterState state) =>
      const LoginPage();
  static Widget home(BuildContext context, GoRouterState state) =>
      const HomePage(); // Replace with actual HomePage when implemented
  static Widget absensi(BuildContext context, GoRouterState state) =>
      const AbsensiPage(); // Replace with actual AbsensiPage when implemented
  static Widget takePhoto(BuildContext context, GoRouterState state) =>
      const TakePhotoPage(); // Replace with actual TakePhoto page when implemented
  static Widget izin(BuildContext context, GoRouterState state) =>
      IzinPage();
  static Widget history(BuildContext context, GoRouterState state) =>
      const HistoryPage();
}
