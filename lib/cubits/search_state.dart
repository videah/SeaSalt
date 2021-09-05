import 'package:meta/meta.dart';

import 'package:seasalt/models/post/e6_post.dart';

/// A generic data class that holds the state for [SearchCubit].
@immutable
abstract class SearchState {
  /// A string of post tags used to search for posts.
  final String tags;

  /// A list of posts pulled from e621/e926.
  final List<E6Post> posts;

  SearchState({required this.tags, required this.posts});
}

/// The default empty state when using [SearchCubit].
///
/// This state shouldn't last long as [search()] is called immediately when
/// [SearchCubit] is constructed.
class SearchInitial extends SearchState {
  SearchInitial() : super(tags: "", posts: []);
}

/// The state when [SearchCubit] is currently loading data.
class SearchLoading extends SearchState {
  /// A string of post tags used to search for posts.
  final String tags;

  /// A list of posts pulled from e621/e926.
  ///
  /// This will either be empty or contain posts from a previous search.
  final List<E6Post> posts;

  SearchLoading({required this.tags, required this.posts})
      : super(tags: tags, posts: posts);
}

/// The state when [SearchCubit] has failed to load posts for whatever reason.
class SearchError extends SearchState {
  /// A string of post tags used to search for posts.
  final String tags;

  /// An error message from a failed search.
  final String error;

  SearchError({required this.tags, required this.error})
      : super(tags: tags, posts: []);
}

/// The state when [SearchCubit] has successfully loaded posts from the API.
class SearchResult extends SearchState {
  /// A string of post tags used to search for posts.
  final String tags;

  /// A list of posts pulled from e621/e926.
  final List<E6Post> posts;

  SearchResult({required this.tags, required this.posts})
      : super(tags: tags, posts: posts);
}
