import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

import 'package:seasalt/cubits/search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarUnfocused(
    duration: Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ));

  Future<void> focus() async {
    emit(SearchBarFocused(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
    ));
  }

  Future<void> unfocus() async => emit(SearchBarUnfocused(
    duration: Duration(milliseconds: 200),
    curve: Curves.easeInOutCubic,
  ));
}
