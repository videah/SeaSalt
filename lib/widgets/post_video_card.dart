import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:seasalt/models/post/e6_post.dart';

class PostVideoCard extends StatelessWidget {

  final E6Post post;

  const PostVideoCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${post.id}",
      child: BetterPlayer.network("${post.file?.url}")
    );
  }
}
