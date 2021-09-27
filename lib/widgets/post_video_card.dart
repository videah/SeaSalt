import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasalt/cubits/video_player_cubit.dart';
import 'package:seasalt/cubits/video_player_state.dart';

import 'package:seasalt/models/post/e6_post.dart';

class PostVideoCard extends StatelessWidget {

  final E6Post post;

  const PostVideoCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${post.id}",
      child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
        builder: (context, state) {
          if (state is VideoSuccess) {
            return Chewie(controller: state.chewieController);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
