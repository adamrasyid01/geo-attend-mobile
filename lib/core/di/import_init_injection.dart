// Get It
import 'package:dio/dio.dart';
import 'package:geo_attend/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:geo_attend/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:geo_attend/features/auth/domain/repositories/auth_repository.dart';
import 'package:geo_attend/features/auth/domain/usecases/user_login.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_form_cubit.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_view_cubit.dart';
import 'package:geo_attend/features/home/presentation/bloc/calendar_cubit.dart';
import 'package:geo_attend/features/home/presentation/bloc/select_jadwal_cubit.dart';
import 'package:get_it/get_it.dart';

part 'init_injection.dart';



