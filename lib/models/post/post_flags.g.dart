// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_flags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFlags _$PostFlagsFromJson(Map<String, dynamic> json) {
  return PostFlags(
    pending: json['pending'] as bool?,
    flagged: json['flagged'] as bool?,
    noteLocked: json['note_locked'] as bool?,
    statusLocked: json['status_locked'] as bool?,
    ratingLocked: json['rating_locked'] as bool?,
    deleted: json['deleted'] as bool?,
  );
}

Map<String, dynamic> _$PostFlagsToJson(PostFlags instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pending', instance.pending);
  writeNotNull('flagged', instance.flagged);
  writeNotNull('note_locked', instance.noteLocked);
  writeNotNull('status_locked', instance.statusLocked);
  writeNotNull('rating_locked', instance.ratingLocked);
  writeNotNull('deleted', instance.deleted);
  return val;
}
