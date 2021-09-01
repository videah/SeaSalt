// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTags _$PostTagsFromJson(Map<String, dynamic> json) {
  return PostTags(
    general:
        (json['general'] as List<dynamic>?)?.map((e) => e as String).toList(),
    species:
        (json['species'] as List<dynamic>?)?.map((e) => e as String).toList(),
    character:
        (json['character'] as List<dynamic>?)?.map((e) => e as String).toList(),
    artist:
        (json['artist'] as List<dynamic>?)?.map((e) => e as String).toList(),
    invalid:
        (json['invalid'] as List<dynamic>?)?.map((e) => e as String).toList(),
    lore: (json['lore'] as List<dynamic>?)?.map((e) => e as String).toList(),
    meta: (json['meta'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PostTagsToJson(PostTags instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('general', instance.general);
  writeNotNull('species', instance.species);
  writeNotNull('character', instance.character);
  writeNotNull('artist', instance.artist);
  writeNotNull('invalid', instance.invalid);
  writeNotNull('lore', instance.lore);
  writeNotNull('meta', instance.meta);
  return val;
}
