import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'absensi_event.dart';
part 'absensi_state.dart';

class AbsensiBloc extends Bloc<AbsensiEvent, AbsensiState> {
  AbsensiBloc() : super(AbsensiInitial()) {
    on<AbsensiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
