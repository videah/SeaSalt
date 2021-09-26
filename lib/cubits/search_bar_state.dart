import 'package:flutter/animation.dart';
import 'package:seasalt/cubits/search_bar_cubit.dart';

/// A generic abstract class to hold state for [SearchBarCubit].
abstract class SearchBarState {
  /// A duration of the animations to play.
  final Duration duration;
  /// A curve to use for the animations.
  final Curve curve;

  SearchBarState({required this.curve, required this.duration});
}

/// The state when [SearchBarCubit] has focused.
class SearchBarUnfocused extends SearchBarState {

  /// A duration of the animations to play.
  @override
  final Duration duration;
  /// A curve to use for the animations.
  @override
  final Curve curve;

  SearchBarUnfocused({required this.duration, required this.curve})
      : super(
          duration: duration,
          curve: curve,
        );
}

/// The state when [SearchBarCubit] has unfocused.
class SearchBarFocused extends SearchBarState {
  /// A duration of the animations to play.
  @override
  final Duration duration;
  /// A curve to use for the animations.
  @override
  final Curve curve;

  SearchBarFocused({required this.duration, required this.curve})
      : super(
    duration: duration,
    curve: curve,
  );
}
