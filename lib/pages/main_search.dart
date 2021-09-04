import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/cubits/search_state.dart';
import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/network.dart';
import 'package:seasalt/services/posts_service.dart';
import 'package:seasalt/widgets/image_tile.dart';
import 'package:seasalt/widgets/search_app_bar.dart';

class MainSearchPage extends StatefulWidget {
  @override
  _MainSearchPageState createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage> {
  E6Post? test = E6Post();

  Future testAPI() async {
    final posts = PostsService.withClient(client);
    var response = await posts.getPostsWithTags("videah");
    var post = response.data?.posts?[4];
    setState(() {
      test = post;
    });
    print("URL: ${post?.file?.url}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: RefreshIndicator(
        onRefresh: context.read<SearchCubit>().refresh,
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            // No results yet, show loading indicator.
            if (!(state is SearchResult))
              return Center(
                child: CircularProgressIndicator(),
              );

            return GridView.builder(
              itemCount: state.posts.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 256.0,
              ),
              itemBuilder: (context, i) {
                return ImageTile(post: state.posts[i]);
              },
            );
          },
        ),
      ),
    );
  }
}
