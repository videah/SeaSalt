import 'package:seasalt/models/autocomplete/autocomplete_tag.dart';
import 'package:seasalt/services/autocomplete_service.dart';

class AutocompleteRepository {
  final AutocompleteService service;

  AutocompleteRepository({required this.service});

  Future<List<AutocompleteTag>> getTags(String tag) async {
    var response = await service.getAutocompleteResults(tag);
    return response.data ?? [];
  }
}