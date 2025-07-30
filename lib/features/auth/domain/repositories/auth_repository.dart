

import 'package:dartz/dartz.dart';
import 'package:geo_attend/config/error/failure.dart';
import 'package:geo_attend/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> authLogin(String email, String password);
 
}