part of 'import_init_injection.dart';

var myInjection = GetIt.instance;

Future<void> initInjection() async {
  // Supabase
  // Register Supabase client
  myInjection.registerLazySingleton(
    () => SupabaseClient(supabaseUrl, supabaseAnonKey)
  );
  
}