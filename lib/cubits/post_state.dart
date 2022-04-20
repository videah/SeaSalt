import 'package:seasalt/models/post/e6_post.dart';

abstract class PostState {}

class PostSingle extends PostState {}

class PostLoadingPool extends PostState {}

class PostPool extends PostState {
  final List<E6Post>? posts;
  final int initialPostIndex;

  PostPool({required this.posts, required this.initialPostIndex});
}