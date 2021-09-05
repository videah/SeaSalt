import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:seasalt/models/post/e6_post.dart';

class PostPage extends StatelessWidget {

  final E6Post? post;

  const PostPage({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#${post?.id}"),
      ),
      body: ListView(
        children: [
          Hero(
            tag: "${post?.id}",
            child: OctoImage(
              image: CachedNetworkImageProvider(
                post?.preview?.url ??
                    "https://i.imgur.com/TVJnMuP.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
