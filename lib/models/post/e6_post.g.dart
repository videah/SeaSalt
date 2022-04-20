// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e6_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

E6Post _$E6PostFromJson(Map<String, dynamic> json) => E6Post(
      id: json['id'] as int?,
      file: json['file'] == null
          ? null
          : PostFile.fromJson(json['file'] as Map<String, dynamic>),
      preview: json['preview'] == null
          ? null
          : PostPreview.fromJson(json['preview'] as Map<String, dynamic>),
      sample: json['sample'] == null
          ? null
          : PostSample.fromJson(json['sample'] as Map<String, dynamic>),
      score: json['score'] == null
          ? null
          : PostScore.fromJson(json['score'] as Map<String, dynamic>),
      tags: json['tags'] == null
          ? null
          : PostTags.fromJson(json['tags'] as Map<String, dynamic>),
      lockedTags: (json['locked_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      changeSeq: json['change_seq'] as int?,
      flags: json['flags'] == null
          ? null
          : PostFlags.fromJson(json['flags'] as Map<String, dynamic>),
      rating: $enumDecodeNullable(_$PostRatingEnumMap, json['rating']),
      favCount: json['fav_count'] as int?,
      sources:
          (json['sources'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pools: (json['pools'] as List<dynamic>?)?.map((e) => e as int).toList(),
      relationships: json['relationships'] == null
          ? null
          : PostRelationships.fromJson(
              json['relationships'] as Map<String, dynamic>),
      approverId: json['approver_id'] as int?,
      uploaderId: json['uploader_id'] as int?,
      description: json['description'] as String?,
      commentCount: json['comment_count'] as int?,
      isFavorited: json['is_favorited'] as bool?,
    );

Map<String, dynamic> _$E6PostToJson(E6Post instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('file', instance.file?.toJson());
  writeNotNull('preview', instance.preview?.toJson());
  writeNotNull('sample', instance.sample?.toJson());
  writeNotNull('score', instance.score?.toJson());
  writeNotNull('tags', instance.tags?.toJson());
  writeNotNull('locked_tags', instance.lockedTags);
  writeNotNull('change_seq', instance.changeSeq);
  writeNotNull('flags', instance.flags?.toJson());
  writeNotNull('rating', _$PostRatingEnumMap[instance.rating]);
  writeNotNull('fav_count', instance.favCount);
  writeNotNull('sources', instance.sources);
  writeNotNull('pools', instance.pools);
  writeNotNull('relationships', instance.relationships?.toJson());
  writeNotNull('approver_id', instance.approverId);
  writeNotNull('uploader_id', instance.uploaderId);
  writeNotNull('description', instance.description);
  writeNotNull('comment_count', instance.commentCount);
  writeNotNull('is_favorited', instance.isFavorited);
  return val;
}

const _$PostRatingEnumMap = {
  PostRating.SAFE: 's',
  PostRating.EXPLICIT: 'e',
  PostRating.QUESTIONABLE: 'q',
};
