import 'package:json_annotation/json_annotation.dart';

/// This is manually tweaked to use int values.
/// TODO: get the model generator working with int values.

enum AutocompleteCategory {
  @JsonValue(0)
  GENERAL,
  @JsonValue(1)
  ARTIST,
  @JsonValue(3)
  COPYRIGHT,
  @JsonValue(4)
  CHARACTERS,
  @JsonValue(5)
  SPECIES,
  @JsonValue(6)
  INVALID,
  @JsonValue(7)
  META,
  @JsonValue(8)
  LORE,
}

const AutocompleteCategoryMapping = {
  AutocompleteCategory.GENERAL: 0,
  AutocompleteCategory.ARTIST: 1,
  AutocompleteCategory.COPYRIGHT: 3,
  AutocompleteCategory.CHARACTERS: 4,
  AutocompleteCategory.SPECIES: 5,
  AutocompleteCategory.INVALID: 6,
  AutocompleteCategory.META: 7,
  AutocompleteCategory.LORE: 8,
};

const reverseAutocompleteCategoryMapping = {
  0: AutocompleteCategory.GENERAL,
  1: AutocompleteCategory.ARTIST,
  3: AutocompleteCategory.COPYRIGHT,
  4: AutocompleteCategory.CHARACTERS,
  5: AutocompleteCategory.SPECIES,
  6: AutocompleteCategory.INVALID,
  7: AutocompleteCategory.META,
  8: AutocompleteCategory.LORE,
};

extension AutocompleteCategoryExtension on AutocompleteCategory {
  int get intValue => AutocompleteCategoryMapping[this]!;
}

extension AutocompleteCategoryStringExtension on int {
  AutocompleteCategory? get asAutocompleteCategory => reverseAutocompleteCategoryMapping[this];
}
