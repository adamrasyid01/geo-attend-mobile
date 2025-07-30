import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geo_attend/features/auth/domain/usecases/user_login.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin userLogin;
  AuthenticationBloc({required this.userLogin}) : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      final result = await userLogin.execute(event.email, event.password);
      result.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (user) => emit(AuthSuccess(message: 'Login successful')),
      );
    });
  }
}
