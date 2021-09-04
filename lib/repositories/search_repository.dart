import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/services/posts_service.dart';

class SearchRepository {
  final PostsService service;

  SearchRepository({required this.service});

  Future<List<E6Post>?> search(String tags) async {
    var response = await service.getPostsWithTags(tags);
    return response.data?.posts;
  }
}
