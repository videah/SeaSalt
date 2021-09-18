import 'package:seasalt/models/autocomplete/autocomplete_category.dart';
import 'package:supercharged/supercharged.dart';
import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

/// A class to define themes in an easily switchable and composable way.
class AppTheme extends ExtendedTheme {
  final String name;
  final String displayName;

  final Color positiveScoreColor;
  final Color negativeScoreColor;

  final Color? artistTagColor;
  final Color? characterTagColor;
  final Color? copyrightTagColor;
  final Color? speciesTagColor;
  final Color? generalTagColor;
  final Color? metaTagColor;
  final Color? loreTagColor;
  final Color? invalidTagColor;

  Color? getAutocompleteColor(AutocompleteCategory? category) {
    switch (category) {
      case AutocompleteCategory.GENERAL:
        return generalTagColor;
      case AutocompleteCategory.ARTIST:
        return artistTagColor;
      case AutocompleteCategory.COPYRIGHT:
        return copyrightTagColor;
      case AutocompleteCategory.CHARACTERS:
        return characterTagColor;
      case AutocompleteCategory.SPECIES:
        return speciesTagColor;
      case AutocompleteCategory.INVALID:
        return invalidTagColor;
      case AutocompleteCategory.META:
        return metaTagColor;
      case AutocompleteCategory.LORE:
        return loreTagColor;
      case null:
        return Colors.white;
    }
  }

  AppTheme(
    this.displayName,
    this.name,
    ThemeData material, {
    this.artistTagColor,
    this.characterTagColor,
    this.copyrightTagColor,
    this.speciesTagColor,
    this.generalTagColor,
    this.metaTagColor,
    this.loreTagColor,
    this.invalidTagColor,
    this.positiveScoreColor = Colors.green,
    this.negativeScoreColor = Colors.red,
  }) : super(material: material);
}

final appThemes = {
  "hexagon": AppTheme(
    "Hexagon",
    "hexagon",
    ThemeData.dark().copyWith(
      primaryColor: "#012e57".toColor(),
      scaffoldBackgroundColor: "#012e57".toColor(),
      canvasColor: "#012e57".toColor(),
      cardColor: "#284a81".toColor(),
    ),
    artistTagColor: "#f2ac08".toColor(),
    copyrightTagColor: "#d0d".toColor(),
    characterTagColor: "#0a0".toColor(),
    speciesTagColor: "#ed5d1f".toColor(),
    generalTagColor: "#b4c7d9".toColor(),
    metaTagColor: Colors.white,
    loreTagColor: "#282".toColor(),
    invalidTagColor: Colors.red,
  ),
  "bloodlust": AppTheme(
    "Bloodlust",
    "bloodlust",
    ThemeData.dark().copyWith(
      primaryColor: "#222".toColor(),
      scaffoldBackgroundColor: "#222".toColor(),
      canvasColor: "#222".toColor(),
      cardColor: "#404040".toColor(),
    ),
  ),
  "serpent": AppTheme(
    "Serpent",
    "serpent",
    ThemeData.light().copyWith(
      primaryColor: "#dacf6b".toColor(),
      scaffoldBackgroundColor: "#dacf6b".toColor(),
      canvasColor: "#dacf6b".toColor(),
      cardColor: "#fff6a5".toColor(),
      primaryIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      primaryTextTheme: const TextTheme(
        headline6: TextStyle(color: Colors.black),
      ),
    ),
  ),
  "pony": AppTheme(
    "Pony",
    "pony",
    ThemeData.dark().copyWith(
      primaryColor: "#2f175c".toColor(),
      scaffoldBackgroundColor: "#2f175c".toColor(),
      canvasColor: "#2f175c".toColor(),
      cardColor: "#503a7a".toColor(),
    ),
  )
};
