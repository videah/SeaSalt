import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:seasalt/style.dart';

/// A circular button that switches to a [ThemeData] with a fancy animation.
class ThemeSelectButton extends StatelessWidget {
  /// The [AppTheme] the button is used to switch to.
  final AppTheme theme;

  /// The display name of the theme.
  ///
  /// This is what's presented to the user, possibly localized to the users
  /// language. This is different from the internal ID given to [ThemeScope].
  final String themeName;

  const ThemeSelectButton(
      {Key? key, required this.theme, required this.themeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hideCheck =
        (Theme.of(context).primaryColor != theme.material?.primaryColor);
    return ThemeSwitcher(
      builder: (context) {
        return Tooltip(
          message: themeName,
          verticalOffset: 36,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: theme.material?.primaryColor,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.white,
                  width: 4,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.check,
                color: hideCheck ? Colors.transparent : Colors.white,
              ),
            ),
            onPressed: () {
              // Write the new theme to storage.
              var box = Hive.box("settings");
              box.put("theme", theme.name);

              // Switch to the new theme in the current session.
              ThemeSwitcher.of(context).changeTheme(
                theme: theme.material!,
              );
            },
          ),
        );
      },
    );
  }
}
