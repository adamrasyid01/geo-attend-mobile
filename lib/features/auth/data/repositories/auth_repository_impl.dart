import 'package:dartz/dartz.dart';
import 'package:geo_attend/config/error/exception.dart';
import 'package:geo_attend/config/error/failure.dart';
import 'package:geo_attend/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:geo_attend/features/auth/data/models/user_model.dart';
import 'package:geo_attend/features/auth/domain/entities/user.dart';
import 'package:geo_attend/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource authremoteDatasource;

  AuthRepositoryImpl({required this.authremoteDatasource});

  @override
  Future<Either<Failure, User>> authLogin(String email, String password) async {
    try {
      UserModel user = await authremoteDatasource.authLogin(email, password);
      return Right(user);
    } on GeneralException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
