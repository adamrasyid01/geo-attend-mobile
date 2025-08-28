// Observasi perubahan state, seperti perubahan data, navigasi, atau interaksi penggunaimport 'dart:developer';

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log("Bloc: $bloc --> $change");
  }
}
