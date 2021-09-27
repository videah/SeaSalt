import 'package:bloc/bloc.dart';
import 'package:seasalt/cubits/video_player_state.dart';
import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/repositories/video_player_repository.dart';
import 'package:seasalt/widgets/post_video_card.dart';

/// A cubit that handles all of the business logic for [PostVideoCard].
class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final E6Post post;

  /// A repository that provides the methods for pulling from the API.
  final VideoPlayerRepository repository;

  VideoPlayerCubit({
    required this.post,
    required this.repository,
  }) : super(VideoInitial()) {
    if (post.file?.ext == "mp4" || post.file?.ext == "webm") {
      load(post.file?.url ?? "");
    }
  }

  Future<void> load(String url) async {
    emit(VideoLoading());

    try {
      var videoController = await repository.setupVideoPlayerController(url);
      var chewieController = await repository.setupChewieController();

      emit(VideoSuccess(
        videoPlayerController: videoController,
        chewieController: chewieController,
      ));
    } catch (e) {
      emit(VideoError(message: "Unknown Error"));
    }
  }
}
