import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) => current is SplashNavigate,
        listener: (context, state) {
          if (state is SplashNavigate) {
            context.go(state.route);
          } 
        },
        child: Scaffold(
          backgroundColor: AppConstants.white,
          body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Image.asset(
                      '${AppConstants.iconPath}/logo.png',
                      width: MediaQuery.sizeOf(
                        context,
                      ).width.clamp(280.0, 360.0),
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
        ),
      ),
    );
  }
}
