import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/cubits/search_state.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  SearchAppBar({Key? key}) : preferredSize = const Size.fromHeight(56), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: () {
                Navigator.of(context).pushNamed("/settings");
              },
            ),
          ],
        ),
        const SearchInputBox(),
        const SearchLoader(),
      ],
    );
  }
}

class SearchInputBox extends StatelessWidget {
  const SearchInputBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 6.0, bottom: 8.0, right: 50.0),
        child: TextField(
          onSubmitted: (tags) {
            context.read<SearchCubit>().search(tags);
          },
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