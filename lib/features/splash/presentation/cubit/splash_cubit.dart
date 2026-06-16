import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial()) {
    _startSplash();
  }

  Future<void> _startSplash() async {
    emit(const SplashFadingIn());
    await Future.delayed(const Duration(seconds: 3));
    if (isClosed) return;
    emit(const SplashNavigate(AppRoutes.login));
  }
}
