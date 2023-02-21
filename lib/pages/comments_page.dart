import 'package:demo_flutter_bloc/api_provider/comments_api_provider.dart';
import 'package:demo_flutter_bloc/bloc/favorites/favorites_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/comments/comments_bloc.dart';
import '../bloc/comments/comments_event.dart';
import '../bloc/comments/comments_state.dart';
import '../models/comments_model.dart';
import 'favorites_page.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        actions: [
          if (context.watch<FavoritesBloc>().favoriteItems.isNotEmpty)
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => const FavoritesPage()));
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ))
        ],
      ),
      body: _commentsBody(),
    );
  }

  Widget _commentsBody() {
    return BlocProvider(
      create: (context) =>
          CommentsBloc(CommentsApiProvider())..add(LoadCommentsEvent()),
      child:
          BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
        if (state is CommentsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CommentsErrorState) {
          return const Center(child: Text("Error..."));
        }
        if (state is CommentsLoadedState) {
          List<Comments> comments = state.comments;
          return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.grey.shade300,
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(comments[index].body ?? "")),
                          IconButton(
                              onPressed: () {
                                if (BlocProvider.of<FavoritesBloc>(context)
                                    .favoriteItems
                                    .contains(comments[index].body)) {
                                  context
                                      .read<FavoritesBloc>()
                                      .favoriteItems
                                      .remove(comments[index].body.toString());
                                  // BlocProvider.of<FavoritesBloc>(context)
                                  //     .favoriteItems
                                  //     .remove(comments[index].body.toString());
                                } else {
                                  // BlocProvider.of<FavoritesBloc>(context)
                                  //     .favoriteItems
                                  //     .add(comments[index].body.toString());
                                  context
                                      .read<FavoritesBloc>()
                                      .favoriteItems
                                      .add(comments[index].body.toString());
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: context
                                        .read<FavoritesBloc>()
                                        .favoriteItems
                                        .contains(comments[index].body)
                                    ? Colors.red
                                    : Colors.white,
                              ))
                        ],
                      )),
                );
              });
        }

        return Container(
          color: Colors.red,
        );
      }),
    );
  }
}
