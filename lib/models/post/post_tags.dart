import 'package:json_annotation/json_annotation.dart';

part 'post_tags.g.dart';

@JsonSerializable(explicitToJson: true)
class PostTags {
  @JsonKey(name: 'general', includeIfNull: false)
  final List<String>? general;
  @JsonKey(name: 'species', includeIfNull: false)
  final List<String>? species;
  @JsonKey(name: 'character', includeIfNull: false)
  final List<String>? character;
  @JsonKey(name: 'artist', includeIfNull: false)
  final List<String>? artist;
  @JsonKey(name: 'invalid', includeIfNull: false)
  final List<String>? invalid;
  @JsonKey(name: 'lore', includeIfNull: false)
  final List<String>? lore;
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
