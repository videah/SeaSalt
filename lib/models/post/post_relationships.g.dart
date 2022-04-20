// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_relationships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRelationships _$PostRelationshipsFromJson(Map<String, dynamic> json) =>
    PostRelationships(
      parentId: json['parent_id'] as int?,
      hasChildren: json['has_children'] as bool?,
      hasActiveChildren: json['has_active_children'] as bool?,
      children:
          (json['children'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PostRelationshipsToJson(PostRelationships instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parent_id', instance.parentId);
  writeNotNull('has_children', instance.hasChildren);
  writeNotNull('has_active_children', instance.hasActiveChildren);
  writeNotNull('children', instance.children);
  return val;
}
