// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSample _$PostSampleFromJson(Map<String, dynamic> json) => PostSample(
      has: json['has'] as bool?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PostSampleToJson(PostSample instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('has', instance.has);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('url', instance.url);
  return val;
}
