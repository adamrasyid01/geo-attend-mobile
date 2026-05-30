import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Image.asset(
                  '${AppConstants.iconPath}/logo.png',
                  width: MediaQuery.sizeOf(context).width.clamp(280.0, 360.0),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 44,
              child: Text(
                'Attendances with geo location.\nVersi ${AppConstants.appVersion}',
                textAlign: TextAlign.center,
                style: AppConstants.regular15.copyWith(
                  color: const Color(0xFF6F6F73),
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
