import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/models/post/post_rating.dart';
import 'package:seasalt/style.dart';

class ImageTile extends StatelessWidget {
  /// The post that contains all of the information needed to render the tile.
  final E6Post? post;

  const ImageTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    post?.preview?.url ?? "https://videah.xyz/images/icon.png",
                  ),
                ),
              ),
              PostDescriptor(
                rating: post?.rating ?? PostRating.SAFE,
                commentCount: post?.commentCount ?? 0,
                favCount: post?.favCount ?? 0,
                score: post?.score?.total ?? 0,
              )
            ],
          )
        ],
      ),
    );
  }
}

class PostDescriptor extends StatelessWidget {
  final PostRating? rating;
  final int? commentCount;
  final int? favCount;
  final int? score;

  const PostDescriptor(
      {Key? key,
      required this.rating,
      required this.commentCount,
      required this.favCount,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScoreIndicator(score: score),
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  size: 14.0,
                ),
                Text(" $favCount"),
              ],
            ),
            Text("C$commentCount"),
            Text("${rating?.stringValue.toUpperCase()}"),
          ],
        ),
      ),
    );
  }
}

class ScoreIndicator extends StatelessWidget {
  final int? score;

  const ScoreIndicator({Key? key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHolder.themeOf<AppTheme>(context);
    Color _scoreColor = score! > 0
        ? theme.positiveScoreColor
        : score! < 0
            ? theme.negativeScoreColor
            : Colors.grey;

    return Row(
      children: [
        if (score! > 0) ...[
          Icon(
            Icons.arrow_upward,
            size: 14.0,
            color: _scoreColor,
          )
        ] else if (score! < 0) ...[
          Icon(
            Icons.arrow_downward,
            size: 14.0,
            color: _scoreColor,
          ),
        ] else ...[
          Icon(Icons.vertical_align_center, size: 14.0, color: _scoreColor),
        ],
        Text(
          " $score",
          style: TextStyle(color: _scoreColor),
        ),
      ],
    );
  }
}
