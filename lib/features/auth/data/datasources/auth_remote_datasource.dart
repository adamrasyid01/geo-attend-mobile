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
    try {
      final AuthResponse authResponse = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final String userId =
          authResponse.user!.id; // Dapatkan ID pengguna dari hasil autentikasi

      // 2. Ambil data tambahan pengguna (termasuk role_id) dari tabel 'users' kustom Anda
      final List<Map<String, dynamic>> userDataList = await supabase
          .from('users')
          .select('*')
          .eq(
            'id',
            userId,
          ); 

      final Map<String, dynamic> userData = userDataList.first;
      print('Response from custom users table: $userData');
      return UserModel.fromJson(userData);
    } on Exception catch (e) {
      throw GeneralException(message: e.toString());
    }
  }
}
