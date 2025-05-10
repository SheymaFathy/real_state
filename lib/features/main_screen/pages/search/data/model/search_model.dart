class SearchModel {
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? statusCode;
  bool? status;
  dynamic message;
  List<Data>? data;
  dynamic errors;

  SearchModel({
    this.currentPage,
    this.totalPages,
    this.totalCount,
    this.pageSize,
    this.hasPreviousPage,
    this.hasNextPage,
    this.statusCode,
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  SearchModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['currentPage'] = currentPage;
    json['totalPages'] = totalPages;
    json['totalCount'] = totalCount;
    json['pageSize'] = pageSize;
    json['hasPreviousPage'] = hasPreviousPage;
    json['hasNextPage'] = hasNextPage;
    json['statusCode'] = statusCode;
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.map((v) => v.toJson()).toList();
    json['errors'] = errors;
    return json;
  }
}

class Data {
  int? id;
  String? category;
  String? type;
  String? sale;
  String? title;
  int? unitArea;
  int? numberOfBedrooms;
  int? numberOfBathrooms;
  int? price;
  String? address;
  String? datePosted;
  String? user;
  String? userPhone;
  bool? isFeatured;
  List<String>? images;

  Data({
    this.id,
    this.category,
    this.type,
    this.sale,
    this.title,
    this.unitArea,
    this.numberOfBedrooms,
    this.numberOfBathrooms,
    this.price,
    this.address,
    this.datePosted,
    this.user,
    this.userPhone,
    this.isFeatured,
    this.images,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    type = json['type'];
    sale = json['sale'];
    title = json['title'];
    unitArea = json['unitArea'];
    numberOfBedrooms = json['numberOfBedrooms'];
    numberOfBathrooms = json['numberOfBathrooms'];
    price = json['price'];
    address = json['address'];
    datePosted = json['datePosted'];
    user = json['user'];
    userPhone = json['userPhone'];
    isFeatured = json['isFeatured'];

    if (json['images'] != null && json['images'] is List) {
      List rawImages = json['images'];
      images = rawImages
          .where((img) => img != null && img.toString().isNotEmpty)
          .map<String>((img) => "https://propertyapi.runasp.net$img")
          .toList();
    } else {
      images = []; // صورة بديلة أو قائمة فاضية
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['category'] = category;
    json['type'] = type;
    json['sale'] = sale;
    json['title'] = title;
    json['unitArea'] = unitArea;
    json['numberOfBedrooms'] = numberOfBedrooms;
    json['numberOfBathrooms'] = numberOfBathrooms;
    json['price'] = price;
    json['address'] = address;
    json['datePosted'] = datePosted;
    json['user'] = user;
    json['userPhone'] = userPhone;
    json['isFeatured'] = isFeatured;
    json['images'] = images;
    return json;
  }
}
