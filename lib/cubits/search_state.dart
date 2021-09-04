import 'package:meta/meta.dart';

import 'package:seasalt/models/post/e6_post.dart';

@immutable
abstract class SearchState {
  final String tags;

  SearchState({required this.tags});
}

class SearchInitial extends SearchState {
  final String tags;

  SearchInitial({required this.tags}) : super(tags: tags);
}

class SearchLoading extends SearchState {
  final String tags;

  SearchLoading({required this.tags}) : super(tags: tags);
}

class SearchError extends SearchState {
  final String tags;
  final String error;

  SearchError({required this.tags, required this.error}) : super(tags: tags);
}

class SearchResult extends SearchState {
  final String tags;
  final List<E6Post> posts;

  SearchResult({required this.tags, required this.posts}) : super(tags: tags);
}