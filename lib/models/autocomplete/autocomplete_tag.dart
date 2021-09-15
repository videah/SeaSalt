import 'package:json_annotation/json_annotation.dart';

part 'autocomplete_tag.g.dart';

@JsonSerializable(explicitToJson: true)
class AutocompleteTag {
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'post_count', includeIfNull: false)
  final int? postCount;
  @JsonKey(name: 'category', includeIfNull: false)
  final int? category;
  @JsonKey(name: 'antecedent_name', includeIfNull: false)
  final String? antecedentName;

  const AutocompleteTag({
    this.id,
    this.name,
    this.postCount,
    this.category,
    this.antecedentName,
  });

  factory AutocompleteTag.fromJson(Map<String, dynamic> json) => _$AutocompleteTagFromJson(json);

  Map<String, dynamic> toJson() => _$AutocompleteTagToJson(this);

}
