import 'package:dio/dio.dart';
import 'package:geo_attend/config/error/exception.dart';
import 'package:geo_attend/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> authLogin(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabase;
  AuthRemoteDataSourceImpl({required this.supabase});
  @override
  Future<UserModel> authLogin(String email, String password) async {
    try{
      final response =
        await supabase
            .from('users')
            .select()
            .eq('email', email)
            .eq('password', password)
            .single();

   
      return UserModel.fromJson(response);
    } on Exception catch (e) {
      throw GeneralException(message: e.toString());
    }
  }
}
