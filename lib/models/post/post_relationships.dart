import 'package:json_annotation/json_annotation.dart';

part 'post_relationships.g.dart';

@JsonSerializable(explicitToJson: true)
class PostRelationships {
  /// The ID of the post's parent, if it has one.
  @JsonKey(name: 'parent_id', includeIfNull: false)
  final int? parentId;
  /// If the post has child posts.
  @JsonKey(name: 'has_children', includeIfNull: false)
  final bool? hasChildren;
  @JsonKey(name: 'has_active_children', includeIfNull: false)
  final bool? hasActiveChildren;
  /// A list of child post IDs that are linked to the post, if it has any.
  @JsonKey(name: 'children', includeIfNull: false)
  final List<int>? children;

  const PostRelationships({
    this.parentId,
    this.hasChildren,
    this.hasActiveChildren,
    this.children,
  });

  factory PostRelationships.fromJson(Map<String, dynamic> json) => _$PostRelationshipsFromJson(json);

  Map<String, dynamic> toJson() => _$PostRelationshipsToJson(this);

}
