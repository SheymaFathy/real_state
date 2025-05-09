class SearchModel {
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? statusCode;
  bool? status;
  Null? message;
  List<Data>? data;
  Null? errors;

  SearchModel(
      {this.currentPage,
        this.totalPages,
        this.totalCount,
        this.pageSize,
        this.hasPreviousPage,
        this.hasNextPage,
        this.statusCode,
        this.status,
        this.message,
        this.data,
        this.errors});

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
        data!.add(new Data.fromJson(v));
      });
    }
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['totalCount'] = this.totalCount;
    data['pageSize'] = this.pageSize;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['errors'] = this.errors;
    return data;
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

  Data(
      {this.id,
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
        this.images});

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
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['type'] = this.type;
    data['sale'] = this.sale;
    data['title'] = this.title;
    data['unitArea'] = this.unitArea;
    data['numberOfBedrooms'] = this.numberOfBedrooms;
    data['numberOfBathrooms'] = this.numberOfBathrooms;
    data['price'] = this.price;
    data['address'] = this.address;
    data['datePosted'] = this.datePosted;
    data['user'] = this.user;
    data['userPhone'] = this.userPhone;
    data['isFeatured'] = this.isFeatured;
    data['images'] = this.images;
    return data;
  }
}
