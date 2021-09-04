import 'package:extended_theme/extended_theme.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/network.dart';
import 'package:seasalt/pages/main_search_page.dart';
import 'package:seasalt/pages/settings_page.dart';
import 'package:seasalt/repositories/search_repository.dart';
import 'package:seasalt/services/posts_service.dart';
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
                "/": (context) => BlocProvider(
                      create: (context) => SearchCubit(
                        repository: SearchRepository(
                          service: PostsService.withClient(client),
                        ),
                      ),
                      child: MainSearchPage(),
                    ),
                "/settings": (context) => SettingsPage(),
              },
            );
          },
        );
      },
    );
  }
}
