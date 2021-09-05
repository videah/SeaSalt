import 'package:json_annotation/json_annotation.dart';

part 'post_tags.g.dart';

@JsonSerializable(explicitToJson: true)
class PostTags {
  /// An array of all the general tags on the post.
  @JsonKey(name: 'general', includeIfNull: false)
  final List<String>? general;
  /// An array of all the species tags on the post.
  @JsonKey(name: 'species', includeIfNull: false)
  final List<String>? species;
  /// An array of all the character tags on the post.
  @JsonKey(name: 'character', includeIfNull: false)
  final List<String>? character;
  /// An array of all the artist tags on the post.
  @JsonKey(name: 'artist', includeIfNull: false)
  final List<String>? artist;
  /// An array of all the invalid tags on the post.
  @JsonKey(name: 'invalid', includeIfNull: false)
  final List<String>? invalid;
  /// An array of all the lore tags on the post.
  @JsonKey(name: 'lore', includeIfNull: false)
  final List<String>? lore;
  /// An array of all the meta tags on the post.
  @JsonKey(name: 'meta', includeIfNull: false)
  final List<String>? meta;

  const PostTags({
    this.general,
    this.species,
    this.character,
    this.artist,
    this.invalid,
    this.lore,
    this.meta,
  });

  factory PostTags.fromJson(Map<String, dynamic> json) => _$PostTagsFromJson(json);

  Map<String, dynamic> toJson() => _$PostTagsToJson(this);

}
