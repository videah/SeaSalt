// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteTag _$AutocompleteTagFromJson(Map<String, dynamic> json) {
  return AutocompleteTag(
    id: json['id'] as int?,
    name: json['name'] as String?,
    postCount: json['post_count'] as int?,
    category: json['category'] as int?,
    antecedentName: json['antecedent_name'] as String?,
  );
}

Map<String, dynamic> _$AutocompleteTagToJson(AutocompleteTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('post_count', instance.postCount);
  writeNotNull('category', instance.category);
  writeNotNull('antecedent_name', instance.antecedentName);
  return val;
}
