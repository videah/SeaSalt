// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFile _$PostFileFromJson(Map<String, dynamic> json) {
  return PostFile(
    width: json['width'] as int?,
    height: json['height'] as int?,
    ext: json['ext'] as String?,
    size: json['size'] as int?,
    md5: json['md5'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$PostFileToJson(PostFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('ext', instance.ext);
  writeNotNull('size', instance.size);
  writeNotNull('md5', instance.md5);
  writeNotNull('url', instance.url);
  return val;
}
