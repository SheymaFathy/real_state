class SearchSetModel {
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
  String? sortBy;

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
    this.sortBy,
  });

  Map<String, dynamic> toJson() {
    return {
      if(location != null)
      'search': location,
      if(unitType != null)
      'unitType': unitType,
      if(userType != null)
      'userType': userType,
      if(minPrice != null)
      'minPrice': minPrice,
      if(maxPrice != null)
      'maxPrice': maxPrice,
      if(numOfRooms != null)
      'NumOfRooms': numOfRooms,
      if(numOfBathrooms != null)
      'NumOfBathrooms': numOfBathrooms,
      if(hotDeals != null)
      'hotDeals': hotDeals,/*
      'page': page,
      'pageSize': pageSize,*/
      //'sortBy': sortBy,
    };
  }

  factory SearchSetModel.fromJson(Map<String, dynamic> json) {
    return SearchSetModel(
      location: json['search'],
      unitType: json['unitType'],
      userType: json['userType'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      numOfRooms: json['NumOfRooms'],
      numOfBathrooms: json['NumOfBathrooms'],
      hotDeals: json['hotDeals'],
      page: json['page'],
      pageSize: json['pageSize'],
    //  sortBy: json['sortBy'],
    );
  }
}
