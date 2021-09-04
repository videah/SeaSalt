import 'package:json_annotation/json_annotation.dart';
import 'package:seasalt/models/post/post_file.dart';
import 'package:seasalt/models/post/post_preview.dart';
import 'package:seasalt/models/post/post_sample.dart';
import 'package:seasalt/models/post/post_score.dart';
import 'package:seasalt/models/post/post_tags.dart';
import 'package:seasalt/models/post/post_flags.dart';
import 'package:seasalt/models/post/post_rating.dart';
import 'package:seasalt/models/post/post_relationships.dart';

part 'e6_post.g.dart';

@JsonSerializable(explicitToJson: true)
class E6Post {
  /// The ID number of the post.
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  /// The post's high-res file info.
  @JsonKey(name: 'file', includeIfNull: false)
  final PostFile? file;
  /// The post's lower-res preview file info.
  @JsonKey(name: 'preview', includeIfNull: false)
  final PostPreview? preview;
  /// The post's sample/thumbnail file info.
  @JsonKey(name: 'sample', includeIfNull: false)
  final PostSample? sample;
  /// The post's user score.
  @JsonKey(name: 'score', includeIfNull: false)
  final PostScore? score;
  /// The tags listed on the post.
  @JsonKey(name: 'tags', includeIfNull: false)
  final PostTags? tags;
  /// A list of tags that are locked on the post.
  @JsonKey(name: 'locked_tags', includeIfNull: false)
  final List<String>? lockedTags;
  @JsonKey(name: 'change_seq', includeIfNull: false)
  final int? changeSeq;
  @JsonKey(name: 'flags', includeIfNull: false)
  final PostFlags? flags;
  /// The post's content rating. Either SAFE, EXPLICIT, or QUESTIONABLE.
  @JsonKey(name: 'rating', includeIfNull: false)
  final PostRating? rating;
  /// How many people have favorited the post.
  @JsonKey(name: 'fav_count', includeIfNull: false)
  final int? favCount;
  /// A list of source URL's for the post.
  @JsonKey(name: 'sources', includeIfNull: false)
  final List<String>? sources;
  /// An array of Pool IDs that the post is a part of.
  @JsonKey(name: 'pools', includeIfNull: false)
  final List<int>? pools;
  @JsonKey(name: 'relationships', includeIfNull: false)
  final PostRelationships? relationships;
  /// The ID of the user that approved the post, if available.
  @JsonKey(name: 'approver_id', includeIfNull: false)
  final int? approverId;
  /// The ID of the user that uploaded the post.
  @JsonKey(name: 'uploader_id', includeIfNull: false)
  final int? uploaderId;
  /// The post's description.
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  /// The number of comments on the post.
  @JsonKey(name: 'comment_count', includeIfNull: false)
  final int? commentCount;
  /// Will return if the authenticated user has favorited the post or not.
  @JsonKey(name: 'is_favorited', includeIfNull: false)
  final bool? isFavorited;

  const E6Post({
    this.id,
    this.file,
    this.preview,
    this.sample,
    this.score,
    this.tags,
    this.lockedTags,
    this.changeSeq,
    this.flags,
    this.rating,
    this.favCount,
    this.sources,
    this.pools,
    this.relationships,
    this.approverId,
    this.uploaderId,
    this.description,
    this.commentCount,
    this.isFavorited,
  });

  factory E6Post.fromJson(Map<String, dynamic> json) => _$E6PostFromJson(json);

  Map<String, dynamic> toJson() => _$E6PostToJson(this);

}
