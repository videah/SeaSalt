import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
            AccountManagementTile(),
            Divider(),
            ThemeSelectTile(),
            Divider(),
            CacheManagementTile(),
          ],
        ),
      ),
    );
  }
}

class AccountManagementTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Sign In"),
      onTap: () {
        Navigator.of(context).pushNamed("/sign-in");
      },
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
              for (var theme in appThemes.values)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ThemeSelectButton(
                    themeName: theme.displayName,
                    theme: theme,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class CacheManagementTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Clear Image Cache",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      onTap: () async {
        //
        try {
          await DefaultCacheManager().emptyCache();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Successfully cleared image cache.",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          print("Could not clear image cache: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Could not clear cache... this could be a bug, please report.",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }
}
