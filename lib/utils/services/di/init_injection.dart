part of 'import_init_injection.dart';

var myInjection = GetIt.instance;

Future<void> initInjection() async {
  // Supabase
  // Register Supabase client
  myInjection.registerLazySingleton(
    () => SupabaseClient(supabaseUrl, supabaseAnonKey)
  );
  
  // FEATURE - AUTH
  // BLOC
  myInjection.registerFactory<AuthBloc>(
    () => AuthBloc(
      userLogin: myInjection(),
    ),
  );
  // USE CASES
   myInjection.registerLazySingleton(() => UserLogin(authRepository: myInjection()));
  
  // REPOSITORY
   myInjection.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authremoteDatasource: myInjection()));

  // DATA SOURCE
   myInjection.registerLazySingleton<AuthRemoteDatasource>(() =>
      AuthRemoteDataSourceImpl(
         supabase:myInjection()));

  // CUBIT
  myInjection.registerFactory<AuthFormCubit>(
    () => AuthFormCubit(),
  );
  myInjection.registerFactory<AuthViewCubit>(
    () => AuthViewCubit(),
  );

}