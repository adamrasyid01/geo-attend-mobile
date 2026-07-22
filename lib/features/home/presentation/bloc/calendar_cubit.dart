import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit({int? initialMonth})
      : pageController = PageController(
          initialPage: (initialMonth ?? DateTime.now().month) - 1,
        ),
        super(const CalendarState());

  final PageController pageController;

  void syncSelectedMonth(int selectedMonth) {
    if (!pageController.hasClients) return;

    final targetPage = selectedMonth - 1;
    final currentPage = pageController.page?.round();

    if (currentPage == targetPage) {
      emit(state.clearProgrammaticTarget());
      return;
    }

    emit(state.copyWith(programmaticTargetPage: targetPage));
    pageController.animateToPage(
      targetPage,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  int? resolveChangedMonth(int pageIndex) {
    final targetPage = state.programmaticTargetPage;

    if (targetPage != null) {
      if (pageIndex == targetPage) {
        emit(state.clearProgrammaticTarget());
      }
      return null;
    }

    return pageIndex + 1;
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}


