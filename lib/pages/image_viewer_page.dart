import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:photo_view/photo_view.dart';
import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/widgets/desktop_title_bar.dart';

class ImageViewerPage extends StatelessWidget {
  final E6Post post;

  const ImageViewerPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We have to take the custom desktop title bar into account because
    // the photo view widget renders under the appbar.
    double padding = Platform.isWindows ? appWindow.titleBarHeight : 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WindowAppBar(
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: padding),
        child: PhotoView(
          heroAttributes: PhotoViewHeroAttributes(tag: "${post.id}"),
          imageProvider: CachedNetworkImageProvider(
            post.file?.url ?? "https://i.imgur.com/TVJnMuP.png",
          ),
        ),
      )
    );
  }
}
