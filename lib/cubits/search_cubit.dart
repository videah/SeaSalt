import 'package:bloc/bloc.dart';
import 'package:seasalt/cubits/search_state.dart';

import 'package:seasalt/repositories/search_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository repository;

  SearchCubit({required this.repository}) : super(SearchInitial(tags: "")) {
    // Searching empty just gives us the "front page" with the newest posts.
    search("");
  }

  Future<void> search(String tags) async {
    // Show loading indicators and potentially store tags for later use.
    emit(SearchLoading(tags: tags));

    // Pull posts using the provided tags.
    final posts = await repository.search(state.tags);

    // Present posts to the the user if we got some, otherwise display an error.
    if (posts != null) {
      emit(SearchResult(tags: state.tags, posts: posts));
    } else {
      emit(SearchError(tags: state.tags, error: "Oops, something went wrong"));
    }
  }

  Future<void> refresh() async => search(state.tags);
}
