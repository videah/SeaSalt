import 'package:json_annotation/json_annotation.dart';
import 'package:seasalt/models/post/e6_post.dart';

part 'post_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PostResponse {
  /// The actual posts!
  @JsonKey(name: 'posts', includeIfNull: false)
  final List<E6Post>? posts;

  const PostResponse({
    this.posts,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);

}
