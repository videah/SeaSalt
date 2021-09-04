import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:seasalt/cubits/search_cubit.dart';
import 'package:seasalt/cubits/search_state.dart';

import 'package:seasalt/widgets/image_tile.dart';
import 'package:seasalt/widgets/search_app_bar.dart';

class MainSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: RefreshIndicator(
        onRefresh: context.read<SearchCubit>().refresh,
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return GridView.builder(
              itemCount: state.posts.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 256.0,
              ),
              itemBuilder: (context, i) {
                return FadeIn(
                  duration: Duration(milliseconds: 250),
                  child: ImageTile(post: state.posts[i]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
