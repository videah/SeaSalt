import 'package:extended_theme/extended_theme.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:seasalt/pages/main_search.dart';
import 'package:seasalt/pages/settings.dart';
import 'package:seasalt/style.dart';

void main() {
  runApp(SeaSalt());
}

class SeaSalt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeScope<AppTheme>(
      themeId: "hexagon",
      availableThemes: appThemes,
      themeBuilder: (context, appTheme) {
        return ThemeProvider(
          initTheme: appTheme.material,
          builder: (context, theme) {
            return MaterialApp(
              title: "SeaSalt",
              theme: theme,
              routes: {
                "/": (context) => MainSearchPage(),
                "/settings": (context) => SettingsPage(),
              },
            );
          },
        );
      },
    );
  }
}