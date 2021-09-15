// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_service.dart';

// **************************************************************************
// BackfitGenerator
// **************************************************************************

class AutocompleteService extends Autocomplete with _$Autocomplete {
  AutocompleteService() {
    _client = BackfitClient();
  }

  AutocompleteService.withClient(BackfitClient client) {
    _client = client;
  }
}

mixin _$Autocomplete implements Autocomplete {
  BackfitClient? _client;

  @override
  Future<Response<List<AutocompleteTag>>> getAutocompleteResults(
      String tag) async {
    final res = await _client!.get(Uri.parse(
        '${_client!.baseUrl}/tags/autocomplete.json?search[name_matches]=$tag'));

    return Response(
      data: res.body.isNotEmpty
          ? (json.decode(res.body) as List)
              .map((it) => AutocompleteTag.fromJson(it))
              .toList()
          : null,
      statusCode: res.statusCode,
      reasonPhrase: res.reasonPhrase,
      headers: HttpHeaders.fromMap(res.headers),
    );
  }
}
