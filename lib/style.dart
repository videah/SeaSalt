import 'package:supercharged/supercharged.dart';
import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

class AppTheme extends ExtendedTheme {
  final String name;

  final Color positiveScoreColor;
  final Color negativeScoreColor;

  AppTheme(this.name, ThemeData material,
      {this.positiveScoreColor = Colors.green,
      this.negativeScoreColor = Colors.red})
      : super(material: material);
}

final appThemes = {
  "hexagon": AppTheme(
    "Hexagon",
    ThemeData.dark().copyWith(
      primaryColor: "#012e57".toColor(),
      scaffoldBackgroundColor: "#012e57".toColor(),
      canvasColor: "#012e57".toColor(),
      cardColor: "#284a81".toColor(),
    ),
  ),
  "bloodlust": AppTheme(
    "Bloodlust",
    ThemeData.dark().copyWith(
      primaryColor: "#222".toColor(),
      scaffoldBackgroundColor: "#222".toColor(),
      canvasColor: "#222".toColor(),
      cardColor: "#404040".toColor(),
    ),
  ),
  "serpent": AppTheme(
    "Serpent",
    ThemeData.light().copyWith(
      primaryColor: "#dacf6b".toColor(),
      scaffoldBackgroundColor: "#dacf6b".toColor(),
      canvasColor: "#dacf6b".toColor(),
      cardColor: "#fff6a5".toColor(),
      primaryIconTheme: IconThemeData(
        color: Colors.black,
      ),
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: Colors.black),
      ),
    ),
  ),
  "pony": AppTheme(
    "Pony",
    ThemeData.dark().copyWith(
      primaryColor: "#2f175c".toColor(),
      scaffoldBackgroundColor: "#2f175c".toColor(),
      canvasColor: "#2f175c".toColor(),
      cardColor: "#503a7a".toColor(),
    ),
  )
};
