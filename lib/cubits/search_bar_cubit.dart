import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

import 'package:seasalt/cubits/search_bar_state.dart';

/// A cubit that handles UI state for [SearchAppBar].
/// This is used to process animations when the search box is focused
/// and unfocused.
class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarUnfocused(
    duration: Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ));

  /// Performs animations when the search box is meant to be focused.
  Future<void> focus() async {
    emit(SearchBarFocused(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
    ));
  }

  /// Performs animations when the search box is meant to be unfocused.
  Future<void> unfocus() async => emit(SearchBarUnfocused(
    duration: Duration(milliseconds: 200),
    curve: Curves.easeInOutCubic,
  ));
}
