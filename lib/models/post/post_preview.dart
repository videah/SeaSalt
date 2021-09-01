import 'package:json_annotation/json_annotation.dart';

part 'post_preview.g.dart';

@JsonSerializable(explicitToJson: true)
class PostPreview {
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;

  const PostPreview({
    this.width,
    this.height,
    this.url,
  });

  factory PostPreview.fromJson(Map<String, dynamic> json) => _$PostPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$PostPreviewToJson(this);

}
