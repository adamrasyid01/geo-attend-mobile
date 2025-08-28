import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_attend/core/observer.dart';
import 'package:geo_attend/utils/routes/app_router.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_form_cubit.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_view_cubit.dart';
import 'package:geo_attend/core/di/import_init_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await initInjection(); // Initialize dependency injection
  Bloc.observer = MyObserver();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => myInjection<AuthBloc>()),
        BlocProvider<AuthFormCubit>(
          create: (context) => myInjection<AuthFormCubit>(),
        ),
        BlocProvider<AuthViewCubit>(
          create: (context) => myInjection<AuthViewCubit>(),
        ),
      ],
      child: SafeArea(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
