import 'package:flutter/material.dart';
import 'package:seasalt/network.dart';
import 'package:seasalt/services/posts_service.dart';

class MainSearchPage extends StatelessWidget {

  Future testAPI() async {
    final posts = PostsService.withClient(client);
    var response = await posts.getPostsWithTags("videah");
    var post = response.data?.posts?.first;
    print("URL: ${post?.file?.url}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SeaSalt"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: "Settings",
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
            },
          )
        ],
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.get_app),
          onPressed: () {
            testAPI();
          },
        ),
      )
    );
  }
}