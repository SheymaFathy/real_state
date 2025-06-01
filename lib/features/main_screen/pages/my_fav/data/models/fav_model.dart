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
  final int unitId;
  final String title;
  final String unitType;
  final int price;
  final int numberOfBedrooms;
  final int numberOfBathrooms;
  final String address;
  final List<String> images;

  FavoriteModelData({
    required this.unitId,
    required this.title,
    required this.unitType,
    required this.price,
    required this.numberOfBedrooms,
    required this.numberOfBathrooms,
    required this.address,
    required this.images,
  });

  factory FavoriteModelData.fromJson(Map<String, dynamic> json) {
    const String baseUrl = "https://propertyapi.runasp.net";

    List<String> imagePaths = [];
    if (json['images'] != null && json['images'] is List) {
      imagePaths = List<String>.from(json['images'].map(
            (imgPath) => "$baseUrl$imgPath",
      ));
    }

    return FavoriteModelData(
      unitId: json['unitId'] ?? 0,
      title: json['unitTitle'] ?? '',
      unitType: json['unitType'] ?? '',
      price: json['price'] ?? 0,
      numberOfBedrooms: json['numberOfBedrooms'] ?? 0,
      numberOfBathrooms: json['numberOfBathrooms'] ?? 0,
      address: json['address'] ?? '',
      images: imagePaths,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unitId': unitId,
      'unitTitle': title,
      'unitType': unitType,
      'price': price,
      'numberOfBedrooms': numberOfBedrooms,
      'numberOfBathrooms': numberOfBathrooms,
      'address': address,
      'images': images,
    };
  }
}
