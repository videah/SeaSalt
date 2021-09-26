import 'dart:convert';
import 'dart:io' show Platform;

import 'package:extended_theme/extended_theme.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:seasalt/cubits/autocomplete_cubit.dart';

import 'package:seasalt/cubits/login_cubit.dart';
import 'package:seasalt/cubits/search_bar_cubit.dart';
import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/network.dart';
import 'package:seasalt/pages/about_page.dart';
import 'package:seasalt/pages/main_search_page.dart';
import 'package:seasalt/pages/settings_page.dart';
import 'package:seasalt/pages/sign_in_page.dart';
import 'package:seasalt/repositories/autocomplete_repository.dart';
import 'package:seasalt/repositories/login_repository.dart';
import 'package:seasalt/repositories/search_repository.dart';
import 'package:seasalt/services/posts_service.dart';
import 'package:seasalt/services/autocomplete_service.dart';
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

  // We spawn a window on desktop with a custom title bar.
  if (Platform.isWindows) {
    doWhenWindowReady(() {
      const initialSize = Size(600, 450);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.title = "SeaSalt";
      appWindow.show();
    });
  }
}

Future<void> setupEncryptedBox() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  var containsEncryptionKey = await secureStorage.containsKey(key: "hive-key");
  // We have to do this for now because there is a bug where containsKey
  // will always return true on macOS. Sad!
  var backupCheck = await secureStorage.read(key: "hive-key");

  if (!containsEncryptionKey || (backupCheck == null)) {
    print("No encrypted box found, creating...");
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: "hive-key", value: base64UrlEncode(key));
  }

  var encryptionKey = await secureStorage.read(key: "hive-key");
  if (encryptionKey != null) {
    var decodedKey = base64Url.decode(encryptionKey);
    await Hive.openBox(
      "secrets",
      encryptionCipher: HiveAesCipher(decodedKey),
    );
    print("Opened encrypted secrets box.");
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
                "/": (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider<SearchCubit>(
                          create: (context) => SearchCubit(
                            repository: SearchRepository(
                              service: PostsService.withClient(client),
                            ),
                          ),
                        ),
                        BlocProvider<AutocompleteCubit>(
                          create: (context) => AutocompleteCubit(
                            repository: AutocompleteRepository(
                              service: AutocompleteService.withClient(client),
                            ),
                          ),
                        ),
                        BlocProvider<SearchBarCubit>(
                          create: (context) => SearchBarCubit(),
                        ),
                      ],
                      child: const MainSearchPage(),
                    ),
                // Do not make const, breaks theme switch animation causing
                // a crash.
                "/settings": (context) => SettingsPage(),
                "/sign-in": (context) => BlocProvider(
                      create: (context) => LoginCubit(
                        repository: LoginRepository(
                          service: PostsService.withClient(client),
                        ),
                      ),
                      child: const SignInPage(),
                    ),
                "/about": (context) => AboutPage(),
              },
            );
          },
        );
      },
    );
  }
}
