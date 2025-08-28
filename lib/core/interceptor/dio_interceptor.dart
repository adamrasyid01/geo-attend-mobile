import 'package:dio/dio.dart';
import 'package:geo_attend/core/network/api_endpoints.dart';

class MyDioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = ApiEndpoints.baseUrl;
    

    options.headers = {'Content-Type': 'application/json'};

    return super.onRequest(options, handler);
  }
}
