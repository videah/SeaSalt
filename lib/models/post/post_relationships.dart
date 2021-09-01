import 'package:json_annotation/json_annotation.dart';

part 'post_relationships.g.dart';

@JsonSerializable(explicitToJson: true)
class PostRelationships {
  @JsonKey(name: 'parent_id', includeIfNull: false)
  final String? parentId;
  @JsonKey(name: 'has_children', includeIfNull: false)
  final bool? hasChildren;
  @JsonKey(name: 'has_active_children', includeIfNull: false)
  final bool? hasActiveChildren;
  @JsonKey(name: 'children', includeIfNull: false)
  final List<String>? children;

  const PostRelationships({
    this.parentId,
    this.hasChildren,
    this.hasActiveChildren,
    this.children,
  });

  factory PostRelationships.fromJson(Map<String, dynamic> json) => _$PostRelationshipsFromJson(json);

  Map<String, dynamic> toJson() => _$PostRelationshipsToJson(this);

}
