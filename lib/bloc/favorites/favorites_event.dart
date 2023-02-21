import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddFavorites extends FavoritesEvent {
  final String addedFavorites;

  const AddFavorites(this.addedFavorites);

  @override
  List<Object> get props => [addedFavorites];

  @override
  String toString() => 'AddFavorites { index: $addedFavorites }';
}

class RemoveFavorites extends FavoritesEvent {
  final String removedFavorites;

  const RemoveFavorites(this.removedFavorites);

  @override
  List<Object> get props => [removedFavorites];

  @override
  String toString() => 'RemoveFavorites { index: $removedFavorites }';
}
