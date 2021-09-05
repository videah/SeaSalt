import 'package:json_annotation/json_annotation.dart';

part 'post_score.g.dart';

@JsonSerializable(explicitToJson: true)
class PostScore {
  /// The number of times voted up.
  @JsonKey(name: 'up', includeIfNull: false)
  final int? up;
  /// A negative number representing the number of times voted down.
  @JsonKey(name: 'down', includeIfNull: false)
  final int? down;
  /// The total score (up + down).
  @JsonKey(name: 'total', includeIfNull: false)
  final int? total;

  const PostScore({
    this.up,
    this.down,
    this.total,
  });

  factory PostScore.fromJson(Map<String, dynamic> json) => _$PostScoreFromJson(json);

  Map<String, dynamic> toJson() => _$PostScoreToJson(this);

}
