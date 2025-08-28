import 'package:dartz/dartz.dart';
import 'package:geo_attend/core/errors/failure.dart';
import 'package:geo_attend/features/auth/domain/entities/user.dart';
import 'package:geo_attend/features/auth/domain/repositories/auth_repository.dart';

class UserLogin {
  final AuthRepository authRepository;
  UserLogin({required this.authRepository});

  Future<Either<Failure, User>> execute(String email, String password) {
    return authRepository.authLogin(email, password);
  }


}
