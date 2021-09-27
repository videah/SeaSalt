import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seasalt/widgets/post_video_card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as desktop;
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/pages/image_viewer_page.dart';
import 'package:seasalt/widgets/desktop_title_bar.dart';
import 'package:seasalt/widgets/post_image_card.dart';
import 'package:seasalt/widgets/tag_column.dart';

enum PostAction { report }

class PostPage extends StatelessWidget {
  final E6Post post;

  const PostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WindowAppBar(
        child: AppBar(
          title: Text("#${post.id}"),
          backwardsCompatibility: true,
          actions: [
            IconButton(
              tooltip: "Share",
              icon: Icon(Icons.share),
              onPressed: () => Share.share("${post.file?.url}"),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem<PostAction>(
                  value: PostAction.report,
                  child: Text("Report Post"),
                ),
              ],
              onSelected: (PostAction action) async {
                if (action == PostAction.report) {
                  if (Platform.isIOS || Platform.isAndroid) {
                    await launch(
                      "https://e621.net/tickets/new?disp_id=${post.id}&type=post",
                      customTabsOption: CustomTabsOption(
                        toolbarColor: Theme.of(context).primaryColor,
                        enableDefaultShare: false,
                      ),
                    );
                  } else {
                    desktop.launch(
                      "https://e621.net/tickets/new?disp_id=${post.id}&type=post",
                    );
                  }
                }
              },
            )
          ],
        ),
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
              title: const Text("Description"),
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
    print(post.file?.ext);
    return ListView(
      children: [
        if (post.file?.ext == "mp4" || post.file?.ext == "webm") ...[
          PostVideoCard(post: post),
        ] else ...[
          InkWell(
            child: PostImageCard(post: post),
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ImageViewerPage(post: post),
                ),
              );
            },
          ),
        ],
        PostTileCollection(post: post),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TagColumn(tags: post.tags!, dense: true),
        )
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
            SizedBox(
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
                      constraints: const BoxConstraints(
                        maxHeight: 690,
                      ),
                      child: Builder(
                        builder: (context) {
                          if (post.file?.ext == "mp4" || post.file?.ext == "webm") {
                            return PostVideoCard(post: post);
                          }
                          return InkWell(
                            child: PostImageCard(post: post),
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: ImageViewerPage(post: post),
                                ),
                              );
                            },
                          );
                        },
                      )
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
