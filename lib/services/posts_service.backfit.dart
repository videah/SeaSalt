// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_service.dart';

// **************************************************************************
// BackfitGenerator
// **************************************************************************

class PostsService extends Posts with _$Posts {
  PostsService() {
    _client = BackfitClient();
  }

  PostsService.withClient(BackfitClient client) {
    _client = client;
  }
}

mixin _$Posts implements Posts {
  BackfitClient? _client;

  @override
  Future<Response<PostResponse>> getPosts() async {
    final res = await _client!.get(Uri.parse('${_client!.baseUrl}/posts.json'));
    return Response(
      data: res.body.isNotEmpty
          ? PostResponse.fromJson(json.decode(res.body))
          : null,
      statusCode: res.statusCode,
      reasonPhrase: res.reasonPhrase,
      headers: HttpHeaders.fromMap(res.headers),
    );
  }

  @override
  Future<Response<PostResponse>> getPostsWithTags(String tags) async {
    final res = await _client!
        .get(Uri.parse('${_client!.baseUrl}/posts.json?tags=$tags'));
    return Response(
      data: res.body.isNotEmpty
          ? PostResponse.fromJson(json.decode(res.body))
          : null,
      statusCode: res.statusCode,
      reasonPhrase: res.reasonPhrase,
      headers: HttpHeaders.fromMap(res.headers),
    );
  }
}
