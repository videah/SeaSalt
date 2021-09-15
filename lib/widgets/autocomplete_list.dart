import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'package:seasalt/cubits/autocomplete_cubit.dart';
import 'package:seasalt/cubits/autocomplete_state.dart';

class AutocompleteList extends StatelessWidget {
  const AutocompleteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteCubit, AutocompleteState>(
      builder: (context, state) {
        if (state is AutocompleteSuccess) {
          return FadeIn(
            child: ListView.builder(
              itemCount: state.tags.length,
              itemBuilder: (context, i) {
                final tag = state.tags[i];
                return Material(
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    title: Text(tag.name ?? "unknown"),
                    trailing: Text("${tag.postCount}"),
                    onTap: () {},
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}