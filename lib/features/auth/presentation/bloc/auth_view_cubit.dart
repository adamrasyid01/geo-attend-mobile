

import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthView { login, absensiPage, landingPageAdmin, landingPageUser }

class AuthViewCubit extends Cubit<AuthView>{
  AuthViewCubit() : super(AuthView.login);

  void showLogin() => emit(AuthView.login);
  void showAbsensiPage() => emit(AuthView.absensiPage);
  void showLandingPageAdmin() => emit(AuthView.landingPageAdmin);
  void showLandingPageUser() => emit(AuthView.landingPageUser);
}