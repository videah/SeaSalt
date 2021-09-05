import 'package:bloc/bloc.dart';

import 'package:seasalt/cubits/search_state.dart';
import 'package:seasalt/repositories/search_repository.dart';

/// A cubit that handles all of the business logic for [MainSearchPage].
class SearchCubit extends Cubit<SearchState> {
  /// A repository that provides the methods for pulling from the API.
  ///
  /// This is meant to be a form of dependency injection but it's not actually
  /// swappable at the moment. TODO: Do proper dependency injection on cubits.
  final SearchRepository repository;

  SearchCubit({required this.repository}) : super(SearchInitial()) {
    // Searching empty just gives us the "front page" with the newest posts.
    search("");
  }

  /// Pulls posts from e621/e926 using provided tags.
  Future<void> search(String tags) async {
    // Show loading indicators and potentially store tags for later use.
    // If there's already posts loaded we keep them displayed during the search.
    emit(SearchLoading(tags: tags, posts: state.posts));

    // Pull posts using the provided tags.
    final posts = await repository.search(state.tags);

    // If we actually got posts display them to the user, else we show an error.
    if (posts != null) {
      emit(SearchResult(tags: state.tags, posts: posts));
    } else {
      emit(SearchError(tags: state.tags, error: "Oops, something went wrong"));
    }
  }

  /// Performs a search with the tags searched with last.
  Future<void> refresh() async => search(state.tags);
}
