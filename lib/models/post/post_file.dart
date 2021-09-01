import 'package:json_annotation/json_annotation.dart';

part 'post_file.g.dart';

@JsonSerializable(explicitToJson: true)
class PostFile {
  /// The width of the post.
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  /// The height of the post.
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  /// The file’s extension.
  @JsonKey(name: 'ext', includeIfNull: false)
  final String? ext;
  /// The size of the file in bytes.
  @JsonKey(name: 'size', includeIfNull: false)
  final int? size;
  /// The MD5 hash of the file.
  @JsonKey(name: 'md5', includeIfNull: false)
  final String? md5;
  /// The URL where the file is hosted on E6.
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;

  const PostFile({
    this.width,
    this.height,
    this.ext,
    this.size,
    this.md5,
    this.url,
  });

  factory PostFile.fromJson(Map<String, dynamic> json) => _$PostFileFromJson(json);

  Map<String, dynamic> toJson() => _$PostFileToJson(this);

}
