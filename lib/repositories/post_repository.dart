import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/services/posts_service.dart';

class PostRepository {
  final PostsService service;

  PostRepository({required this.service});

  Future<List<E6Post>?> getPoolPosts(int poolId) async {
    var response = await service.getPostsWithPool(poolId);
    return response.data?.posts;
  }
}
