import 'package:meta/meta.dart';

import 'package:seasalt/models/post/e6_post.dart';

@immutable
abstract class SearchState {
  final String tags;
  final List<E6Post> posts;

  SearchState({required this.tags, required this.posts});
}

class SearchInitial extends SearchState {
  final String tags;

  SearchInitial({required this.tags}) : super(tags: tags, posts: []);
}

class SearchLoading extends SearchState {
  final String tags;
  final List<E6Post> posts;

  SearchLoading({required this.tags, required this.posts})
      : super(
          tags: tags,
          posts: posts,
        );
}

class SearchError extends SearchState {
  final String tags;
  final String error;

  SearchError({required this.tags, required this.error}) : super(tags: tags, posts: []);
}

class SearchResult extends SearchState {
  final String tags;
  final List<E6Post> posts;

  SearchResult({required this.tags, required this.posts}) : super(tags: tags, posts: posts);
}
