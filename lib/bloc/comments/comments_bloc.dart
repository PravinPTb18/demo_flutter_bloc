import 'package:demo_flutter_bloc/api_provider/comments_api_provider.dart';
import 'package:demo_flutter_bloc/bloc/comments/comments_event.dart';
import 'package:demo_flutter_bloc/bloc/comments/comments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentsApiProvider _commentsRepo;

  CommentsBloc(this._commentsRepo) : super(CommentsLoadingState()) {
    on<LoadCommentsEvent>((event, emit) async {
      emit(CommentsLoadingState());
      try {
        final comments = await _commentsRepo.getComments();
        emit(CommentsLoadedState(comments));
      } catch (e) {
        emit(CommentsErrorState(e.toString()));
      }
    });
  }
}
