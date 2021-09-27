import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerRepository {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  Future<VideoPlayerController> setupVideoPlayerController(String url) async {
    videoPlayerController = VideoPlayerController.network(url);
    return videoPlayerController;
  }

  Future<ChewieController> setupChewieController() async {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
    );

    return chewieController;
  }
}
