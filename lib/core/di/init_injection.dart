part of 'import_init_injection.dart';

var myInjection = GetIt.instance;

Future<void> initInjection() async {
  // Supabase
  
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
         dio:myInjection()));

  // CUBIT
  myInjection.registerFactory<AuthFormCubit>(
    () => AuthFormCubit(),
  );
  myInjection.registerFactory<AuthViewCubit>(
    () => AuthViewCubit(),
  );

}