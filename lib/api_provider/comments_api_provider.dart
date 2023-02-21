import 'package:http/http.dart';
import '../constants/constants.dart';
import '../models/comments_model.dart';

class CommentsApiProvider {
  Future<List<Comments>> getComments() async {
    Response response = await get(Uri.parse(Constants.endUrl));
    if (response.statusCode == 200) {
      return commentsFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
