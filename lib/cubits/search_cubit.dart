import 'package:bloc/bloc.dart';
import 'package:seasalt/cubits/search_state.dart';

import 'package:seasalt/repositories/search_repository.dart';

class SearchCubit extends Cubit<SearchState> {

  final SearchRepository repository;

  SearchCubit({required this.repository}) : super(SearchInitial(tags: ""));

  Future<void> search(String tags) async {
    // Show loading indicators and potentially store tags for later use.
    emit(SearchLoading(tags: tags));

    // Pull posts using the provided tags.
    final posts = await repository.search(state.tags);

    if (posts != null) {
      emit(SearchResult(tags: state.tags, posts: posts));
    } else {
      emit(SearchError(tags: state.tags, error: "Oops, something went wrong"));
    }
  }

  Future<void> refresh() async => search(state.tags);
}
