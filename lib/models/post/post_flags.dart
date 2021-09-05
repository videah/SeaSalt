import 'package:json_annotation/json_annotation.dart';

part 'post_flags.g.dart';

@JsonSerializable(explicitToJson: true)
class PostFlags {
  /// If the post is pending approval.
  @JsonKey(name: 'pending', includeIfNull: false)
  final bool? pending;
  /// If the post is flagged for deletion.
  @JsonKey(name: 'flagged', includeIfNull: false)
  final bool? flagged;
  /// If the post has its notes locked.
  @JsonKey(name: 'note_locked', includeIfNull: false)
  final bool? noteLocked;
  /// If the post's status has been locked.
  @JsonKey(name: 'status_locked', includeIfNull: false)
  final bool? statusLocked;
  /// If the post's rating has been locked.
  @JsonKey(name: 'rating_locked', includeIfNull: false)
  final bool? ratingLocked;
  /// If the post has been deleted.
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;

  const PostFlags({
    this.pending,
    this.flagged,
    this.noteLocked,
    this.statusLocked,
    this.ratingLocked,
    this.deleted,
  });

  factory PostFlags.fromJson(Map<String, dynamic> json) => _$PostFlagsFromJson(json);

  Map<String, dynamic> toJson() => _$PostFlagsToJson(this);

}
