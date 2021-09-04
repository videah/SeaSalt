import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/cubits/search_state.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  SearchAppBar({Key? key}) : preferredSize = Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: () {
                Navigator.of(context).pushNamed("/settings");
              },
            ),
          ],
        ),
        SearchInputBox(),
        SearchLoader(),
      ],
    );
  }
}

class SearchInputBox extends StatelessWidget {
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
            filled: true,
            hintText: "Search...",
            contentPadding: const EdgeInsets.fromLTRB(12, 22, 12, 14),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        // No results yet, show loading indicator.
        if (!(state is SearchResult)) {
          return SafeArea(
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