import 'package:json_annotation/json_annotation.dart';

enum PostRating {
  @JsonValue('s')
  SAFE,
  @JsonValue('e')
  EXPLICIT,
  @JsonValue('q')
  QUESTIONABLE,
}
