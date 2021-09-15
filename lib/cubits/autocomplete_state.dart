import 'package:seasalt/models/autocomplete/autocomplete_tag.dart';

abstract class AutocompleteState {}

class AutocompleteInitial extends AutocompleteState {}
class AutocompleteEmpty extends AutocompleteState {}
class AutocompleteLoading extends AutocompleteState {}
class AutocompleteSuccess extends AutocompleteState {
  final List<AutocompleteTag> tags;

  AutocompleteSuccess({required this.tags});
}