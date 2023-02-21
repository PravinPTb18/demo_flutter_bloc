import 'dart:developer';

import 'package:demo_flutter_bloc/bloc/favorites/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorites/favorites_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: _favoriteBody(),
    );
  }

  Widget _favoriteBody() {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
      log(state.toString());
      if (state is FavoritesAdded) {
        var _favorites = BlocProvider.of<FavoritesBloc>(context).favoriteItems;
        return ListView.builder(
            itemCount: _favorites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey.shade300,
                    child: Text(_favorites[index].toString())),
              );
            });
      }

      return Container(
        color: Colors.red,
      );
    });
  }
}
