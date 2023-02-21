import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CommentsEvent extends Equatable {
  const CommentsEvent();
}

class LoadCommentsEvent extends CommentsEvent {
  @override
  List<Object?> get props => [];
}
