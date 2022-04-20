import 'package:backfit/backfit.dart';
import 'package:seasalt/models/post/post_response.dart';

part 'posts_service.backfit.dart';

@BackfitService()
abstract class Posts {
  @Get("posts.json")
  Future<Response<PostResponse>> getPosts();

  @Get("posts.json")
  Future<Response<PostResponse>> getPostsWithTags(
    @Query("tags") String tags,
  );

  Future<Response<PostResponse>> getPostsWithPool(int poolId) {
    return getPostsWithTags("pool:$poolId");
  }
}
