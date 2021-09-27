import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:seasalt/cubits/video_player_cubit.dart';

/// A generic empty class to hold state for [VideoPlayerCubit].
abstract class VideoPlayerState {}

/// The state when [VideoPlayerCubit] has just been loaded.
class VideoInitial extends VideoPlayerState {}

/// The state when [VideoPlayerCubit] is currently loading.
class VideoLoading extends VideoPlayerState {}

/// The state when [VideoPlayerCubit] has successfully logged the user in.
class VideoSuccess extends VideoPlayerState {
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;

  VideoSuccess({required this.videoPlayerController, required this.chewieController});
}

/// The state when [VideoPlayerCubit] has failed to log the user in.
class VideoError extends VideoPlayerState {
  /// An error message to present to users to tell them what went wrong.
  final String message;

  VideoError({required this.message});
}