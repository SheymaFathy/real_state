import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/comments_model.dart';

class CommentRepository {
  Future<void> postComment(CommentModel model) async {
    const String url = 'https://propertyapi.runasp.net/Comments';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(model.toJson()),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to post comment');
      }
    } catch (e) {
      throw Exception('Failed to post comment: $e');
    }
  }
}
