import 'package:json_annotation/json_annotation.dart';

enum PostRating {
  @JsonValue('s')
  SAFE,
  @JsonValue('e')
  EXPLICIT,
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
