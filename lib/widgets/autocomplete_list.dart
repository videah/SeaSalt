import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:seasalt/cubits/autocomplete_cubit.dart';
import 'package:seasalt/cubits/autocomplete_state.dart';
import 'package:seasalt/style.dart';

class AutocompleteList extends StatelessWidget {
  const AutocompleteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteCubit, AutocompleteState>(
      builder: (context, state) {
        if (state is AutocompleteSuccess) {
          return FadeIn(
            child: ResponsiveBuilder(
              builder: (context, info) {
                return Container(
                  constraints: BoxConstraints(
                    maxWidth: (info.isDesktop || info.isTablet) ? 600 : double.infinity,
                  ),
                  child: ListView.builder(
                    itemCount: state.tags.length,
                    itemBuilder: (context, i) {
                      final tag = state.tags[i];
                      final theme = ThemeHolder.themeOf<AppTheme>(context);
                      final color = theme.getAutocompleteColor(tag.category);
                      final style = TextStyle(color: color);
                      return Material(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(tag.name ?? "unknown", style: style),
                              if (tag.antecedentName != null) ...[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.arrow_forward, size: 14),
                                ),
                                Text(tag.antecedentName!, style: style),
                              ]
                            ],
                          ),
                          trailing: Text("${tag.postCount}", style: style),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                );
              }
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}