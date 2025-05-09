class CommentModel {
  final int unitId;
  final String content;

  CommentModel({
    required this.unitId,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'unitId': unitId,
      'content': content,
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      unitId: json['unitId'],
      content: json['content'],
    );
  }
}
