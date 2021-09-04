import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:supercharged/supercharged.dart';

import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/models/post/post_rating.dart';
import 'package:seasalt/style.dart';

/// A widget that presents information about a [E6Post].
///
/// This is designed to look and function as close as possible to the actual
/// tiles you see on e621. It shows a thumbnail along with a score users have
/// voted on, the number of favourites the post has, the number of comments
/// the post has, and the content rating. The border is rendered different
/// colors depending on if it has relationships with other posts.
class ImageTile extends StatelessWidget {
  /// The post that contains all of the information needed to render the tile.
  final E6Post? post;

  const ImageTile({Key? key, required this.post}) : super(key: key);

  /// Generates an appropriate border color for posts that have relationships.
  Color _getBorderColor(BuildContext context) {
    if (post?.relationships?.hasChildren ?? false) {
      return "#0f0".toColor();
    } else if (post?.relationships?.parentId != null) {
      return "#cc0".toColor();
    } else {
      return Theme.of(context).cardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getBorderColor(context),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: post?.file?.width?.toDouble(),
                    color: Theme.of(context).cardColor,
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                        post?.preview?.url ??
                            "https://videah.xyz/images/icon.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              PostDescriptor(
                rating: post?.rating ?? PostRating.SAFE,
                commentCount: post?.commentCount ?? 0,
                favCount: post?.favCount ?? 0,
                score: post?.score?.total ?? 0,
              ),
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

  Color _getRatingColor() {
    switch (rating) {
      case PostRating.SAFE:
        return Colors.white;
      case PostRating.EXPLICIT:
        return "#e45f5f".toColor();
      case PostRating.QUESTIONABLE:
        return "#e4e150".toColor();
      case null:
        return Colors.white;
    }
  }

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
            Text(
              "${rating?.stringValue.toUpperCase()}",
              style: TextStyle(
                color: _getRatingColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
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
          Icon(
            Icons.vertical_align_center,
            size: 14.0,
            color: _scoreColor,
          ),
        ],
        Text(
          " $score",
          style: TextStyle(
            color: _scoreColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
