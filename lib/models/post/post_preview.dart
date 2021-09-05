import 'package:json_annotation/json_annotation.dart';

part 'post_preview.g.dart';

@JsonSerializable(explicitToJson: true)
class PostPreview {
  /// The width of the post preview.
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  /// The height of the post preview.
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  /// The URL where the preview file is hosted on E6.
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
