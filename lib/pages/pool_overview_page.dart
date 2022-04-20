import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/widgets/image_tile.dart';

class PoolOverviewPage extends StatelessWidget {
  const PoolOverviewPage({Key? key, this.posts}) : super(key: key);

  final List<E6Post>? posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pool"),
      ),
      body: GridView.builder(
        itemCount: posts?.length,
        gridDelegate:
        const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 256.0,
        ),
        itemBuilder: (context, i) {
          return FadeIn(
            duration: const Duration(milliseconds: 250),
            child: ImageTile(post: posts?[i]),
          );
        },
      ),
    );
  }
}