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
    category:
        _$enumDecodeNullable(_$AutocompleteCategoryEnumMap, json['category']),
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
  writeNotNull('category', _$AutocompleteCategoryEnumMap[instance.category]);
  writeNotNull('antecedent_name', instance.antecedentName);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
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
