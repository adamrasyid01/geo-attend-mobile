import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  // Ambil dari .env
  static String get baseUrl => dotenv.get('BASE_URL');

  // Auth Endpoints
  static String get login => '$baseUrl/login';
}
