part of 'calendar_cubit.dart';

class CalendarState extends Equatable {
  const CalendarState({this.programmaticTargetPage});

  final int? programmaticTargetPage;

  CalendarState copyWith({int? programmaticTargetPage}) {
    return CalendarState(
      programmaticTargetPage:
          programmaticTargetPage ?? this.programmaticTargetPage,
    );
  }

  CalendarState clearProgrammaticTarget() {
    return const CalendarState();
  }

  @override
  List<Object?> get props => [programmaticTargetPage];
}


