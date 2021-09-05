import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/widgets/post_image_card.dart';
import 'package:seasalt/widgets/tag_column.dart';

class PostPage extends StatelessWidget {
  final E6Post post;

  const PostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#${post.id}"),
      ),
      body: ResponsiveBuilder(
        builder: (context, info) {
          if (info.deviceScreenType == DeviceScreenType.mobile) {
            return PostMobileLayout(post: post);
          } else {
            return PostTabletLayout(post: post);
          }
        },
      ),
    );
  }
}

class PostTileCollection extends StatelessWidget {
  final E6Post post;

  const PostTileCollection({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (post.description != null && post.description!.isNotEmpty)
          Card(
            child: ExpansionTile(
              expandedAlignment: Alignment.topLeft,
              initiallyExpanded: true,
              title: Text("Description"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${post.description}"),
                ),
              ],
            ),
          )
      ],
    );
  }
}

class PostMobileLayout extends StatelessWidget {
  final E6Post post;

  const PostMobileLayout({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostImageCard(post: post),
        PostTileCollection(post: post),
      ],
    );
  }
}

class PostTabletLayout extends StatelessWidget {
  final E6Post post;

  const PostTabletLayout({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TagColumn(tags: post.tags!),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Theme.of(context).cardColor,
                      constraints: BoxConstraints(
                        maxHeight: 690,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: PostImageCard(post: post),
                      ),
                    ),
                  ),
                  PostTileCollection(post: post),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
