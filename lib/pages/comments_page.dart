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

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Comments"),
          actions: [
            // Displaying the number favorites available
            // using bloc builder
            if (context.watch<FavoritesBloc>().favoriteItems.isNotEmpty)
              Text(
                  BlocProvider.of<FavoritesBloc>(context)
                      .favoriteItems
                      .length
                      .toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            // Displaying the favorites icon to navigate to favorites screen
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
                  )),
          ],
        ),
        body: _commentsBody(),
      );
    });
  }

  // A widget which displays the list of comments with favorite icon button
  // to save it in favorite list
  Widget _commentsBody() {
    return BlocProvider(
      create: (context) =>
          CommentsBloc(CommentsApiProvider())..add(LoadCommentsEvent()),
      child:
          BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
        // Displays the loader if comments state is loading
        if (state is CommentsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // Displays the error if comments state is error
        if (state is CommentsErrorState) {
          return const Center(child: Text("Error..."));
        }
        // Displays the list of comments if comments state is loaded
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
                          // Displays the comments
                          Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(comments[index].body ?? "")),
                          // Displays the icon button
                          IconButton(
                              onPressed: () {
                                // Removes from the favorite list
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

                                  // Adds to the favorite list
                                  context
                                      .read<FavoritesBloc>()
                                      .favoriteItems
                                      .add(comments[index].body.toString());
                                }
                                setState(() {});
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

        // Display empty container of no state id define
        return Container(
          color: Colors.red,
        );
      }),
    );
  }
}
