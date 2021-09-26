import 'package:seasalt/cubits/autocomplete_cubit.dart';
import 'package:seasalt/models/autocomplete/autocomplete_tag.dart';

/// A generic empty class to hold state for [AutocompleteCubit].
abstract class AutocompleteState {}

/// The state when [AutocompleteCubit] has just been loaded.
class AutocompleteInitial extends AutocompleteState {}

/// The state when [AutocompleteCubit] is currently sitting empty.
class AutocompleteEmpty extends AutocompleteState {}

/// The state when [AutocompleteCubit] is currently loading tags.
class AutocompleteLoading extends AutocompleteState {}

/// The state when [AutocompleteCubit] successfully loaded tags.
class AutocompleteSuccess extends AutocompleteState {
  /// A list of tags retrieved from autocomplete results.
  final List<AutocompleteTag> tags;

  AutocompleteSuccess({required this.tags});
}