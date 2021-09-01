import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:seasalt/style.dart';
import 'package:seasalt/widgets/theme_select_button.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: [
            ThemeSelectTile(),
          ],
        ),
      ),
    );
  }
}

class ThemeSelectTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Theme"),
          leading: Icon(Icons.format_paint_rounded),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Wrap(
            children: [
              for (var theme in appThemes.values) Padding(
                padding: const EdgeInsets.all(8.0),
                child: ThemeSelectButton(
                  themeName: theme.name,
                  theme: theme,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}