import 'package:bloc/bloc.dart';

import 'package:seasalt/cubits/post_state.dart';
import 'package:seasalt/models/post/e6_post.dart';
import 'package:seasalt/repositories/post_repository.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository repository;
  final E6Post initialPost;

  PostCubit({
    required this.repository,
    required this.initialPost,
  }) : super(PostSingle()) {
    if (initialPost.pools!.isNotEmpty) {
      print("Loading pool into post page...");
      loadPool(initialPost.pools!.first);
    }
  }

  void loadPool(int poolId) async {
    emit(PostLoadingPool());
    final posts = await repository.getPoolPosts(poolId);
    final sortedPosts = posts?.reversed.toList();
    final currentPost = sortedPosts?.firstWhere((post) => post.id == initialPost.id);
    final initialIndex = sortedPosts?.indexOf(currentPost!);
    emit(PostPool(posts: sortedPosts, initialPostIndex: initialIndex!));
  }
}
