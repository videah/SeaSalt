import 'package:backfit/backfit.dart';
import 'package:seasalt/models/autocomplete/autocomplete_tag.dart';

part 'autocomplete_service.backfit.dart';

@BackfitService()
abstract class Autocomplete {
  @Get("tags/autocomplete.json")
  Future<Response<List<AutocompleteTag>>> getAutocompleteResults(
    @Query("search[name_matches]") String tag,
  );
}
