import 'package:dio/dio.dart';
import 'package:geo_attend/core/errors/exception.dart';
import 'package:geo_attend/core/interceptor/dio_interceptor.dart';
import 'package:geo_attend/core/network/api_endpoints.dart';
import 'package:geo_attend/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> authLogin(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final Dio dio;
  AuthRemoteDataSourceImpl({required this.dio}) {
    dio.interceptors.add(MyDioInterceptor());
  }
  @override
  Future<UserModel> authLogin(String email, String password) async {
    try {
      final Response response = await dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        // Shared preferences
        return UserModel.fromJson(response.data);
      }else if(response.statusCode == 401){
        throw GeneralException(message: 'Unauthorized: Invalid email or password.');
      }
      throw GeneralException(message: response.data['message'] ?? 'An error occurred');
    } on DioException catch (e) {
      throw GeneralException(message: e.response!.data['message'] ?? 'Network error occurred');
    }
  }
}
