import 'package:json_annotation/json_annotation.dart';

part 'post_sample.g.dart';

@JsonSerializable(explicitToJson: true)
class PostSample {
  @JsonKey(name: 'has', includeIfNull: false)
  final bool? has;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
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
