import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:seasalt/style.dart';
import 'package:seasalt/widgets/desktop_title_bar.dart';
import 'package:seasalt/widgets/theme_select_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: WindowAppBar(
          child: AppBar(
            title: const Text("Settings"),
          ),
        ),
        body: ListView(
          children: [
            AccountManagementTile(),
            Divider(),
            ThemeSelectTile(),
            Divider(),
            NSFWTile(),
            Divider(),
            ListTile(
              title: Text("About SeaSalt"),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).pushNamed("/about");
              },
            ),
            Divider(),
            CacheManagementTile(),
          ],
        ),
      ),
    );
  }
}

class AccountManagementTile extends StatelessWidget {
  const AccountManagementTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box("secrets").listenable(),
      builder: (context, secrets, widget) {
        if (!secrets.containsKey("credentials")) {
          return ListTile(
            title: const Text("Sign In"),
            onTap: () async {
              var success = await Navigator.of(context).pushNamed("/sign-in");
              await Future.delayed(const Duration(milliseconds: 100));
              if (success == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: ListTile(
                      title: Text("Successfully signed in."),
                      leading: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return Column(
            children: [
              ListTile(
                title: Text("Signed in as: ${secrets.get("username")}"),
              ),
              ListTile(
                title: const Text("Sign Out"),
                onTap: () async {
                  await secrets.delete("credentials");
                },
              ),
            ],
          );
        }
      },
    );
  }
}

class ThemeSelectTile extends StatelessWidget {
  const ThemeSelectTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
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
  const CacheManagementTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "Clear Image Cache",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      onTap: () async {
        //
        try {
          await DefaultCacheManager().emptyCache();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
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
            const SnackBar(
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

class NSFWTile extends StatelessWidget {
  const NSFWTile({Key? key}) : super(key: key);

  void _setValue(bool? value) => Hive.box("settings").put("show_nsfw", value);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box("secrets").listenable(),
      builder: (context, secrets, widget) {
        return ValueListenableBuilder<Box>(
          valueListenable: Hive.box("settings").listenable(),
          builder: (context, settings, widget) {
            bool signedIn = secrets.containsKey("credentials");
            return CheckboxListTile(
              title: Text("Show NSFW Posts"),
              subtitle: Text("Must have an e621 account."),
              value: !signedIn ? false : settings.get("show_nsfw") ?? false,
              onChanged: signedIn ? _setValue : null,
            );
          },
        );
      },
    );
  }
}

class RequireSignIn extends StatelessWidget {
  final Widget child;

  const RequireSignIn({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box("secrets").listenable(),
      builder: (context, secrets, widget) {
        return secrets.containsKey("credentials") == true ? child : Container();
      },
    );
  }
}
