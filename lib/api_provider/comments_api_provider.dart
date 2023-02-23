import 'package:http/http.dart';
import '../constants/constants.dart';
import '../models/comments_model.dart';

/// Handles the api request for comments
class CommentsApiProvider {
  // Gets the list of comments from the api
  Future<List<Comments>> getComments() async {
    Response response = await get(Uri.parse(Constants.endUrl));

    // Parse the response to the comments model if
    // status code is 200 else throw exception
    if (response.statusCode == 200) {
      return commentsFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
