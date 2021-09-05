import 'package:json_annotation/json_annotation.dart';

part 'post_sample.g.dart';

@JsonSerializable(explicitToJson: true)
class PostSample {
  /// If the post has a sample/thumbnail or not.
  @JsonKey(name: 'has', includeIfNull: false)
  final bool? has;
  /// The width of the post sample.
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  /// The height of the post sample.
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  /// The URL where the sample file is hosted on E6.
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;

  const PostSample({
    this.has,
    this.width,
    this.height,
    this.url,
  });

  factory PostSample.fromJson(Map<String, dynamic> json) => _$PostSampleFromJson(json);

  Map<String, dynamic> toJson() => _$PostSampleToJson(this);

}
