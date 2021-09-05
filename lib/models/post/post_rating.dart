import 'package:json_annotation/json_annotation.dart';

enum PostRating {
  /// The post should be safe for work.
  @JsonValue('s')
  SAFE,
  /// The post is riding the line making it NSFW.
  @JsonValue('e')
  EXPLICIT,
  /// The post is straight up NSFW.
  @JsonValue('q')
  QUESTIONABLE,
}

const PostRatingMapping = {
  PostRating.SAFE: 's',
  PostRating.EXPLICIT: 'e',
  PostRating.QUESTIONABLE: 'q',
};

const reversePostRatingMapping = {
  's': PostRating.SAFE,
  'e': PostRating.EXPLICIT,
  'q': PostRating.QUESTIONABLE,
};

extension PostRatingExtension on PostRating {
  String get stringValue => PostRatingMapping[this]!;
}

extension PostRatingStringExtension on String {
  PostRating? get asPostRating => reversePostRatingMapping[this];
}
