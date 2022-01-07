import 'package:flutter/material.dart';

class PostSourceCard extends StatelessWidget {
  const PostSourceCard({Key? key, required this.sourceURLs}) : super(key: key);

  final List<String> sourceURLs;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          for (var url in sourceURLs) ...[
            ListTile(
              title: Text(url),
            )
          ]
        ],
      ),
    );
  }
}