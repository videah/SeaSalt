import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            // No results yet, show loading indicator.
            if (!(state is SearchResult))
              return Center(
                child: CircularProgressIndicator(),
              );

            return GridView.builder(
              itemCount: state.posts.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 256.0,
              ),
              itemBuilder: (context, i) {
                return ImageTile(post: state.posts[i]);
              },
            );
          },
        ),
      ),
    );
  }
}
