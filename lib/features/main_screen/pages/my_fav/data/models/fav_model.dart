// ignore_for_file: prefer_collection_literals

class FavoriteModel {
  int? statusCode;
  bool? status;
  String? message;
  List<FavoriteModelData>? data;

  FavoriteModel({this.statusCode, this.status, this.message, this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FavoriteModelData>[];
      json['data'].forEach((v) {
        data!.add(FavoriteModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteModelData {
  int? unitId;
  String? unitTitle;

  FavoriteModelData({this.unitId, this.unitTitle});

  FavoriteModelData.fromJson(Map<String, dynamic> json) {
    unitId = json['unitId'];
    unitTitle = json['unitTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['unitId'] = unitId;
    data['unitTitle'] = unitTitle;
    return data;
  }
}
