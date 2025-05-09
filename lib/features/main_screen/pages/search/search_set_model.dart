class SearchSetModel{
  String? location;
  int? unitType;
  int? userType;
  int? minPrice;
  int? maxPrice;
  int? numOfRooms;
  int? numOfBathrooms;
int? hotDeals;
  int? page;
  int? pageSize;

  SearchSetModel({
    this.location,
    this.unitType,
    this.userType,
    this.minPrice,
    this.maxPrice,
    this.numOfRooms,
    this.numOfBathrooms,
    this.hotDeals,
    this.page,
    this.pageSize,

  });
  Map<String, dynamic> toJson() {
    return {
      'search': location,
      'unitType': unitType,
      'userType': userType,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'numOfRooms': numOfRooms,
      'numOfBathrooms': numOfBathrooms,
      'hotDeals': hotDeals,
      'page': page,
      'pageSize': pageSize,
    };
  }
  factory SearchSetModel.fromJson(Map<String, dynamic> json) {
    return SearchSetModel(
      location: json['search'],
      unitType: json['unitType'],
      userType: json['userType'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      numOfRooms: json['numOfRooms'],
      numOfBathrooms: json['numOfBathrooms'],
      hotDeals: json['hotDeals'],
      page: json['page'],
      pageSize: json['pageSize'],
    );
  }
}