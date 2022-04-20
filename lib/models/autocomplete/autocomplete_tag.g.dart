// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteTag _$AutocompleteTagFromJson(Map<String, dynamic> json) =>
    AutocompleteTag(
      id: json['id'] as int?,
      name: json['name'] as String?,
      postCount: json['post_count'] as int?,
      category:
          $enumDecodeNullable(_$AutocompleteCategoryEnumMap, json['category']),
      antecedentName: json['antecedent_name'] as String?,
    );

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
  writeNotNull('category', _$AutocompleteCategoryEnumMap[instance.category]);
  writeNotNull('antecedent_name', instance.antecedentName);
  return val;
}

const _$AutocompleteCategoryEnumMap = {
  AutocompleteCategory.GENERAL: 0,
  AutocompleteCategory.ARTIST: 1,
  AutocompleteCategory.COPYRIGHT: 3,
  AutocompleteCategory.CHARACTERS: 4,
  AutocompleteCategory.SPECIES: 5,
  AutocompleteCategory.INVALID: 6,
  AutocompleteCategory.META: 7,
  AutocompleteCategory.LORE: 8,
};
