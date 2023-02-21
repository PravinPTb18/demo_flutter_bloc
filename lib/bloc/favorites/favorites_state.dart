import 'package:flutter/material.dart';

abstract class FavoritesState {
  final List<String>? favorites;
  const FavoritesState({@required this.favorites});

  @override
  List<Object> get props => [];
}

class FavoritesLoadInProgress extends FavoritesState {}

class FavoritesAdded extends FavoritesState {
  final List<String> favorites1;

  const FavoritesAdded({required this.favorites1})
      : super(favorites: favorites1);

  @override
  List<Object> get props => [favorites1];

  // @override
  // String toString() => 'FavoritesAdded { todos: $favorites }';
}

class FavoritesRemoved extends FavoritesState {
  final List<String> favorites;

  const FavoritesRemoved({required this.favorites})
      : super(favorites: favorites);

  @override
  List<Object> get props => [favorites];

  // @override
  // String toString() => 'FavoritesRemoved { todos: $favorites }';
}
