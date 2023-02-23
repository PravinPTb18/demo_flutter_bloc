import 'package:demo_flutter_bloc/api_provider/comments_api_provider.dart';
import 'package:demo_flutter_bloc/bloc/comments/comments_event.dart';
import 'package:demo_flutter_bloc/bloc/comments/comments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Comments bloc calls to handle events and set state for the comments
class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  // Here we create the instance of comments api provider so we can
  // api methods easily
  final CommentsApiProvider _commentsRepo;

  CommentsBloc(this._commentsRepo) : super(CommentsLoadingState()) {
    // Here it will respond the event and emit the state for comments
    on<LoadCommentsEvent>((event, emit) async {
      // Sets the comments state to loading
      emit(CommentsLoadingState());
      try {
        // Here we will call api and emits the comments data
        final comments = await _commentsRepo.getComments();
        // Sets the state to loaded and passes the comments received from api
        emit(CommentsLoadedState(comments));
      } catch (e) {
        emit(CommentsErrorState(e.toString()));
      }
    });
  }
}
