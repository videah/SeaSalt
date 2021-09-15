import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasalt/cubits/search_bar_cubit.dart';
import 'package:seasalt/cubits/search_bar_state.dart';

import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/cubits/search_state.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  SearchAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(),
        SettingsButton(),
        const SearchInputBox(),
        const SearchLoader(),
      ],
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarCubit, SearchBarState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: state.duration,
          curve: state.curve,
          right: (state is SearchBarUnfocused) ? 5 : -36,
          top: 7,
          child: SafeArea(
            child: IconButton(
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: () {
                Navigator.of(context).pushNamed("/settings");
              },
            ),
          ),
        );
      },
    );
  }
}

class SearchInputBox extends StatelessWidget {
  const SearchInputBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SearchBarCubit, SearchBarState>(
        builder: (context, state) {
          final isFocused = (state is SearchBarFocused);
          return AnimatedPadding(
            duration: state.duration,
            curve: state.curve,
            padding: EdgeInsets.only(
              top: 8.0,
              left: 6.0,
              bottom: 8.0,
              right: isFocused ? 6.0 : 50.0,
            ),
            child: FocusScope(
              onFocusChange: (focused) {
                if (focused) {
                  context.read<SearchBarCubit>().focus();
                } else {
                context.read<SearchBarCubit>().unfocus();
                }
              },
              child: TextField(
                onSubmitted: (tags) {
                  context.read<SearchCubit>().search(tags);
                },
                onEditingComplete: () {
                  context.read<SearchBarCubit>().unfocus();
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  hintText: "Search...",
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

class SearchLoader extends StatelessWidget {
  const SearchLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        // No results yet, show loading indicator.
        if (state is! SearchResult) {
          return const SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
