import 'package:flutter/animation.dart';

abstract class SearchBarState {
  final Duration duration;
  final Curve curve;

  SearchBarState({required this.curve, required this.duration});
}

class SearchBarUnfocused extends SearchBarState {
  @override
  final Duration duration;
  @override
  final Curve curve;

  SearchBarUnfocused({required this.duration, required this.curve})
      : super(
          duration: duration,
          curve: curve,
        );
}

class SearchBarFocused extends SearchBarState {
  @override
  final Duration duration;
  @override
  final Curve curve;

  SearchBarFocused({required this.duration, required this.curve})
      : super(
    duration: duration,
    curve: curve,
  );
}
