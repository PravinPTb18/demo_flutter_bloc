import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/comments_model.dart';

/// Helps to compare two object easily
@immutable
abstract class CommentsState extends Equatable {}

// It will define the state loading
class CommentsLoadingState extends CommentsState {
  @override
  List<Object?> get props => [];
}

// It will define the state loaded
class CommentsLoadedState extends CommentsState {
  final List<Comments> comments;
  CommentsLoadedState(this.comments);
  // Gets the comments data if the state is loaded
  @override
  List<Object?> get props => [comments];
}

// It will define the state error
class CommentsErrorState extends CommentsState {
  final String error;
  CommentsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
