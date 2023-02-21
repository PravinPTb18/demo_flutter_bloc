import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesAdded(favorites1: [])) {
    on<AddFavorites>((event, emit) {
      _favoriteItems.add(event.addedFavorites);
      emit(FavoritesAdded(favorites1: _favoriteItems));
    });

    on<RemoveFavorites>((event, emit) {
      _favoriteItems.remove(event.removedFavorites);
      emit(FavoritesRemoved(favorites: _favoriteItems));
    });
  }

  final List<String> _favoriteItems = [];
  List<String> get favoriteItems => _favoriteItems;
}
