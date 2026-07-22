import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/home/presentation/widgets/beranda/header.dart';
import 'package:geo_attend/features/home/presentation/widgets/beranda/history.dart';
import 'package:geo_attend/features/home/presentation/widgets/beranda/menu_square.dart';

import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.pageBackground,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(26, 28, 26, 128),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(onCheckInTap: () => context.push(AppRoutes.takePhoto)),
              const SizedBox(height: 24),
              const MenuSquare(),
              const SizedBox(height: 24),
              const History(),
            ],
          ),
        ),
      ),
    );
  }
}
