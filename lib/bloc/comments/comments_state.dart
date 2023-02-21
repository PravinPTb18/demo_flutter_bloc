import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/comments_model.dart';

@immutable
abstract class CommentsState extends Equatable {}

class CommentsLoadingState extends CommentsState {
  @override
  List<Object?> get props => [];
}

class CommentsLoadedState extends CommentsState {
  final List<Comments> comments;
  CommentsLoadedState(this.comments);
  @override
  List<Object?> get props => [comments];
}

class CommentsErrorState extends CommentsState {
  final String error;
  CommentsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
