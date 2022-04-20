// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostScore _$PostScoreFromJson(Map<String, dynamic> json) => PostScore(
      up: json['up'] as int?,
      down: json['down'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PostScoreToJson(PostScore instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('up', instance.up);
  writeNotNull('down', instance.down);
  writeNotNull('total', instance.total);
  return val;
}
