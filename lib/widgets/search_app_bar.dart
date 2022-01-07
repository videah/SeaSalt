import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:seasalt/cubits/autocomplete_cubit.dart';

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
        if (Platform.isIOS) CancelButton(),
        SettingsButton(),
        SearchInputBox(),
        const SearchLoader(),
      ],
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarCubit, SearchBarState>(
      builder: (context, state) {
        final isFocused = (state is SearchBarFocused);
        return Align(
          alignment: Alignment.centerRight,
          child: AnimatedOpacity(
            duration: state.duration,
            curve: state.curve,
            opacity: isFocused ? 1 : 0,
            child: SafeArea(
              child: CupertinoButton(
                child: Text("Cancel"),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  context.read<SearchBarCubit>().unfocus();
                },
              ),
            ),
          ),
        );
      },
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
          right: (state is SearchBarUnfocused) ? 5 : -80,
          top: 2,
          child: SafeArea(
            child: IconButton(
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: () {
                EasyDebounce.cancel("autocomplete-debounce");
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
  SearchInputBox({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SearchBarCubit, SearchBarState>(
        builder: (context, state) {
          final isFocused = (state is SearchBarFocused);
          final offset = Platform.isIOS ? 80.0 : 6.0;
          return AnimatedPadding(
            duration: state.duration,
            curve: state.curve,
            padding: EdgeInsets.only(
              top: 4.0,
              left: 6.0,
              bottom: 8.0,
              right: isFocused ? offset : 50.0,
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
                controller: _controller,
                autocorrect: false,
                onSubmitted: (tags) {
                  FocusScope.of(context).unfocus();
                  context.read<SearchCubit>().search(tags);
                },
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                  context.read<SearchBarCubit>().unfocus();
                },
                onChanged: (value) {
                  // We just want to do autocomplete on the last word.
                  final words = value.split(" ");
                  if (words.last.length < 3) {
                    EasyDebounce.cancel("autocomplete-debounce");
                    context.read<AutocompleteCubit>().clear();
                  } else {
                    EasyDebounce.debounce(
                      "autocomplete-debounce",
                      Duration(milliseconds: 200),
                      () {
                        context.read<AutocompleteCubit>().getTags(words.last);
                      },
                    );
                  }
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  // The ClipOval and Material is required here to prevent
                  // the InkWell from rendering behind the TextField.
                  suffixIcon: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        tooltip: "Clear",
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          EasyDebounce.cancel("autocomplete-debounce");
                          context.read<AutocompleteCubit>().clear();
                        },
                      ),
                    ),
                  ),
                  isDense: true,
                  filled: true,
                  hintText: "Search...",
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
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
