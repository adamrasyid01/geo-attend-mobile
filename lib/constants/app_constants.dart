// Menyimpan semua nilai tetap (constant) yang digunakan di seluruh aplikasi.

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  // App Info
  static const String appName = 'Geo-Attend';
  static const String appVersion = '1.0.0';

  // API
  static const String baseApiUrl = 'https:supabaseinstance';
  static const int apiTimeout = 30; // in seconds

  // UI Defaults
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;

  // Image Assets
  static const String iconPath = 'assets/icons';
  static const String imgPath = 'assets/images';

  // Messages
  static const String networkError = 'Network error. Please try again later.';
  static const String unknownError = 'Something went wrong.';

  // Keys
  static const String userTokenKey = 'user_token';
  static const String onboardingSeenKey = 'onboarding_seen';

  // Colors
  static Color warning500 = const Color(0xffff8800);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color gray500 = const Color(0xFF8A8A8E);
  static Color error500 = const Color(0xFFE54545);
  static Color success500 = Color(0xFF0F9918);
  static Color textField = const Color(0xFFD9D9D9);
  static const Color primaryBlue = Color(0xFF1757D2);
  static const Color softBlue = Color(0xFFD9E9FF);
  static const Color pageBackground = Color(0xFFF6F6F6);
  static const Color borderColor = Color(0xFFE8E8E8);
  static const Color orange = Color(0xFFFF9F2D);
  static const Color red = Color(0xFFFF5B5B);

  // MEDIUM TEXT STYLES
  static TextStyle medium10 = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppConstants.black,
  );
  static TextStyle medium14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppConstants.black,
  );
  static TextStyle medium18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppConstants.black,
  );
  static TextStyle medium20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppConstants.black,
  );
  static TextStyle medium24 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppConstants.black,
  );
  static TextStyle medium36 = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: AppConstants.black,
  );

  // SEMIBOLD TEXT STYLES
  static TextStyle semibold14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppConstants.black,
  );
  static TextStyle semibold18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppConstants.black,
  );

  static TextStyle semibold20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppConstants.black,
  );

  static TextStyle semibold24 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppConstants.black,
  );

  // REGULAR TEXT STYLES
  static TextStyle regular15 = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppConstants.black,
  );

  // BOLD TEXT STYLES
  static TextStyle bold24 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppConstants.black,
  );
  static TextStyle bold20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppConstants.black,
  );
}

