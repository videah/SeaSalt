import 'package:json_annotation/json_annotation.dart';

part 'post_flags.g.dart';

@JsonSerializable(explicitToJson: true)
class PostFlags {
  @JsonKey(name: 'pending', includeIfNull: false)
  final bool? pending;
  @JsonKey(name: 'flagged', includeIfNull: false)
  final bool? flagged;
  @JsonKey(name: 'note_locked', includeIfNull: false)
  final bool? noteLocked;
  @JsonKey(name: 'status_locked', includeIfNull: false)
  final bool? statusLocked;
  @JsonKey(name: 'rating_locked', includeIfNull: false)
  final bool? ratingLocked;
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
