import 'package:bloc/bloc.dart';

import 'package:seasalt/cubits/autocomplete_state.dart';
import 'package:seasalt/repositories/autocomplete_repository.dart';

/// A cubit to handle the business logic for tag autocomplete.
class AutocompleteCubit extends Cubit<AutocompleteState> {
  /// A repository that provides the methods for pulling from the API.
  final AutocompleteRepository repository;

  AutocompleteCubit({required this.repository}) : super(AutocompleteInitial());

  /// Clears the autocomplete state.
  Future<void> clear() async {
    emit(AutocompleteInitial());
  }

  /// Pulls tags from the autocomplete API that match the input.
  Future<void> getTags(String tag) async {
    final tags = await repository.getTags(tag);
    emit(tags.isEmpty ? AutocompleteEmpty() : AutocompleteSuccess(tags: tags));
  }
}
