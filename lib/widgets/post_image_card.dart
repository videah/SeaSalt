import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:seasalt/models/post/e6_post.dart';

class PostImageCard extends StatelessWidget {
  final E6Post post;

  const PostImageCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${post.id}",
      child: OctoImage(
        width: double.infinity,
        fit: BoxFit.fitHeight,
        image: CachedNetworkImageProvider(
          post.file?.url ?? "https://i.imgur.com/TVJnMuP.png",
        ),
        placeholderBuilder: (context) {
          return OctoImage(
            width: double.infinity,
            fit: BoxFit.fitHeight,
            image: CachedNetworkImageProvider(
              post.sample?.url ?? "https://i.imgur.com/TVJnMuP.png",
            ),
            placeholderBuilder: (context) {
              return OctoImage(
                width: double.infinity,
                fit: BoxFit.fitHeight,
                image: CachedNetworkImageProvider(
                  post.preview?.url ?? "https://i.imgur.com/TVJnMuP.png",
                ),
              );
            },
          );
        },
      ),
    );
  }
}
