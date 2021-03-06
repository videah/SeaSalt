import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seasalt/cubits/post_cubit.dart';
import 'package:seasalt/cubits/post_state.dart';
import 'package:seasalt/pages/pool_overview_page.dart';
import 'package:seasalt/widgets/post_source_card.dart';
import 'package:seasalt/widgets/post_video_card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as desktop;
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/pages/image_viewer_page.dart';
import 'package:seasalt/widgets/desktop_title_bar.dart';
import 'package:seasalt/widgets/post_image_card.dart';
import 'package:seasalt/widgets/tag_column.dart';

enum PostAction { report, browser }

class PostPage extends StatelessWidget {
  final E6Post post;

  PostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WindowAppBar(
        child: AppBar(
          title: Text("#${post.id}"),
          actions: [
            if (post.pools!.isNotEmpty) ...[
              BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if (state is PostPool) {
                    return PlatformIconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PoolOverviewPage(
                              posts: state.posts,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return PlatformIconButton(
                      icon: Icon(Icons.search),
                    );
                  }
                },
              )
            ],
            PlatformIconButton(
              icon: Icon(Icons.share),
              cupertinoIcon: Icon(CupertinoIcons.share),
              onPressed: () => Share.share("https://e621.net/posts/${post.id}"),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem<PostAction>(
                  value: PostAction.report,
                  child: Text("Report Post"),
                ),
                PopupMenuItem<PostAction>(
                  value: PostAction.browser,
                  child: Text("Open in browser"),
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
                if (action == PostAction.browser) {
                  if (Platform.isIOS || Platform.isAndroid) {
                    await launch(
                      "https://e621.net/posts/${post.id}",
                      customTabsOption: CustomTabsOption(
                        toolbarColor: Theme.of(context).primaryColor,
                        enableDefaultShare: true,
                      ),
                    );
                  } else {
                    desktop.launch(
                      "https://e621.net/posts/${post.id}",
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
            return BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                if (state is PostPool) {
                  // We should probably be doing this elsewhere but atm it's
                  // unlikely for this to be rebuilt so it should be ok.
                  final PageController _pageController = PageController(
                    initialPage: state.initialPostIndex,
                  );
                  return PageView.builder(
                    controller: _pageController,
                    itemCount: state.posts?.length,
                    itemBuilder: (context, i) {
                      return PostMobileLayout(
                        post: state.posts![i],
                      );
                    },
                  );
                }
                return PostMobileLayout(post: post);
              },
            );
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
            onLongPress: () => Share.share("${post.file?.url}"),
          ),
        ],
        PostTileCollection(post: post),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TagColumn(tags: post.tags!, dense: true),
        ),
        PostSourceCard(sourceURLs: post.sources!),
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
                          if (post.file?.ext == "mp4" ||
                              post.file?.ext == "webm") {
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
