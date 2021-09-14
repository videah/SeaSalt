import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:seasalt/cubits/search_bar_cubit.dart';
import 'package:seasalt/cubits/search_bar_state.dart';
import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/cubits/search_state.dart';
import 'package:seasalt/widgets/desktop_title_bar.dart';

import 'package:seasalt/widgets/image_tile.dart';
import 'package:seasalt/widgets/search_app_bar.dart';

class MainSearchPage extends StatelessWidget {
  const MainSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: WindowAppBar(
          child: SearchAppBar(),
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: context.read<SearchCubit>().refresh,
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return GridView.builder(
                    itemCount: state.posts.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 256.0,
                    ),
                    itemBuilder: (context, i) {
                      return FadeIn(
                        duration: const Duration(milliseconds: 250),
                        child: ImageTile(post: state.posts[i]),
                      );
                    },
                  );
                },
              ),
            ),
            BlocBuilder<SearchBarCubit, SearchBarState>(
              builder: (context, state) {
                final isFocused = (state is SearchBarFocused);
                return IgnorePointer(
                  ignoring: !isFocused,
                  child: GestureDetector(
                    onTap: () {
                      context.read<SearchBarCubit>().unfocus();
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      color: isFocused ? Colors.black.withAlpha(180) : Colors.transparent,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
