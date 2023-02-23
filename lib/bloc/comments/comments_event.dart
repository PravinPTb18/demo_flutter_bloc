import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Comments class extends to equatable, which helps to compare the object easily
/// without any boiler code
@immutable
abstract class CommentsEvent extends Equatable {
  const CommentsEvent();
}

class LoadCommentsEvent extends CommentsEvent {
  // List of properties that determines two instance are equal
  @override
  List<Object?> get props => [];
}
