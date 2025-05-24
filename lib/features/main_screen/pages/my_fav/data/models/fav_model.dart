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
        data!.add(FavoriteModelData.fromJson(
            v,
            v['unitId'] ?? 0,
            v['unitTitle'] ?? '',
            v['unitType'] ?? '',
            v['price'] ?? 0,
            v['numberOfBedrooms'] ?? 0,
            v['numberOfBathrooms'] ?? 0,
            v['address'] ?? '',
            List<String>.from(v['images'] ?? []),
        ));
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
  late final int unitId;
  late final String title;
  final String unitType;
  final int price;
  final int numberOfBedrooms;
  final int numberOfBathrooms;
  final String address;
  final List<String> images;


  FavoriteModelData(this.unitType, this.price, this.numberOfBedrooms, this.numberOfBathrooms, this.address, this.images, {required this.unitId, required this.title});

  FavoriteModelData.fromJson(Map<String, dynamic> json, this.unitId, this.title, this.unitType, this.price, this.numberOfBedrooms, this.numberOfBathrooms, this.address, this.images) {
    unitId = json['unitId'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['unitId'] = unitId;
    data['unitTitle'] = title;
    return data;
  }
}
