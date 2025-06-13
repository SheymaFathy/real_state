import 'package:real_state/core/dio/dio_helper.dart';
import '../model/comments_model.dart';

class CommentRepository {
  Future<void> postComment(CommentModel model) async {
    try {
      final response = await DioHelper.postData(
        url: "Comments",
        data: model.toJson(),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to post comment');
      }
    } catch (e) {
      throw Exception('Failed to post comment: $e');
    }
  }
}
