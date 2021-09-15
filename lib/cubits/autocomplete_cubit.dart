import 'package:bloc/bloc.dart';

import 'package:seasalt/cubits/autocomplete_state.dart';
import 'package:seasalt/repositories/autocomplete_repository.dart';

class AutocompleteCubit extends Cubit<AutocompleteState> {
  final AutocompleteRepository repository;

  AutocompleteCubit({required this.repository}) : super(AutocompleteInitial());

  Future<void> clear() async {
    emit(AutocompleteInitial());
  }

  Future<void> getTags(String tag) async {
    final tags = await repository.getTags(tag);

    if (tags.isEmpty) {
      emit(AutocompleteEmpty());
    } else {
      emit(AutocompleteSuccess(tags: tags));
    }
  }

}
