class UnitModel {
  final String search;
  final int page;
  final int pageSize;
  final int unitType;
  final int userType;
  final int minPrice;
  final int maxPrice;
  final int numOfRooms;
  final int numOfBathrooms;

  UnitModel({
    this.search = '',
    this.page = 1,
    this.pageSize = 50,
    this.unitType = 0,
    this.userType = 0,
    this.minPrice = 0,
    this.maxPrice = 0,
    this.numOfRooms = 0,
    this.numOfBathrooms = 0,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      search: json['search'] ?? '',
      page: json['page'] ?? 1,
      pageSize: json['pageSize'] ?? 50,
      unitType: json['unitType'] ?? 0,
      userType: json['userType'] ?? 0,
      minPrice: json['minPrice'] ?? 0,
      maxPrice: json['maxPrice'] ?? 0,
      numOfRooms: json['numOfRooms'] ?? 0,
      numOfBathrooms: json['numOfBathrooms'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'search': search,
      'page': page,
      'pageSize': pageSize,
      'unitType': unitType,
      'userType': userType,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'numOfRooms': numOfRooms,
      'numOfBathrooms': numOfBathrooms,
    };
  }
}
