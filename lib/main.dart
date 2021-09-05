import 'dart:convert';

import 'package:extended_theme/extended_theme.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/network.dart';
import 'package:seasalt/pages/main_search_page.dart';
import 'package:seasalt/pages/settings_page.dart';
import 'package:seasalt/pages/sign_in_page.dart';
import 'package:seasalt/repositories/search_repository.dart';
import 'package:seasalt/services/posts_service.dart';
import 'package:seasalt/style.dart';

void main() async {
  // Initialize local Hive database.
  await Hive.initFlutter();

  // Get initial settings from the Hive box.
  var settings = await Hive.openBox("settings");
  var theme = settings.get("theme") ?? "hexagon";
  print("Opened settings box: ${settings.keys}");

  // Open encrypted Hive box for credentials.
  await setupEncryptedBox();

  // We're go for lift-off!
  runApp(SeaSalt(themeId: theme));
}

Future<void> setupEncryptedBox() async {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var containsEncryptionKey = await secureStorage.containsKey(key: "hive-key");
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: "hive-key", value: base64UrlEncode(key));
  }

  var encryptionKey = await secureStorage.read(key: "hive-key");
  if (encryptionKey != null) {
    var decodedKey = base64Url.decode(encryptionKey);
    await Hive.openBox(
      "credentials",
      encryptionCipher: HiveAesCipher(decodedKey),
    );
    print("Opened encrypted credentials box.");
  } else {
    print("ERROR: Could not get local database encryption key. 😬");
  }
}

class SeaSalt extends StatelessWidget {
  final String themeId;

  const SeaSalt({Key? key, required this.themeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScope<AppTheme>(
      themeId: themeId,
      availableThemes: appThemes,
      themeBuilder: (context, appTheme) {
        return ThemeProvider(
          initTheme: appTheme.material,
          builder: (context, theme) {
            return MaterialApp(
              title: "SeaSalt",
              theme: theme,
              routes: {
                "/": (context) => BlocProvider(
                      create: (context) => SearchCubit(
                        repository: SearchRepository(
                          service: PostsService.withClient(client),
                        ),
                      ),
                      child: MainSearchPage(),
                    ),
                "/settings": (context) => SettingsPage(),
                "/sign-in": (context) => SignInPage(),
              },
            );
          },
        );
      },
    );
  }
}
