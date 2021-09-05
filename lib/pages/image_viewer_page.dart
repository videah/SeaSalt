import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:seasalt/models/post/e6_post.dart';

class ImageViewerPage extends StatelessWidget {
  final E6Post post;

  const ImageViewerPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: "${post.id}"),
        imageProvider: CachedNetworkImageProvider(
          post.file?.url ?? "https://i.imgur.com/TVJnMuP.png",
        ),
      )
    );
  }
}
