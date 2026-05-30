import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    _startSplash();
  }

  Future _startSplash() async {
    emit(SplashFadingIn());
    await Future.delayed(const Duration(seconds: 3));
    emit(const SplashNavigate(AppRoutes.login));
  }
}
