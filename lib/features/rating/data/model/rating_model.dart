class RatingModel {
  final int unitId;
  final int ratingValue;

  RatingModel({required this.unitId, required this.ratingValue});

  Map<String, dynamic> toJson() {
    return {
      "unitId": unitId,
      "ratingValue": ratingValue,
    };
  }

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      unitId: json['unitId'],
      ratingValue: json['ratingValue'],
    );
  }
}
