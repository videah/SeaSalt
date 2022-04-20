// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPreview _$PostPreviewFromJson(Map<String, dynamic> json) => PostPreview(
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PostPreviewToJson(PostPreview instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('url', instance.url);
  return val;
}
