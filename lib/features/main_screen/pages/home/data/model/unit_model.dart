class UnitModel {
  final int id;
  final String title;
  final String type;
  final int price;
  final int numOfRooms;
  final int numOfBathrooms;
  final int unitArea;
  final String address;
  final List<String> imageUrl;
  final DateTime datePosted;
  final String resourceLink;
  final String? developerPortfolio;
  String? description;
  bool isFavorite;
  bool isFeatured;

  UnitModel({
    required this.id,
    required this.title,
    required this.type,
    required this.price,
    required this.numOfRooms,
    required this.numOfBathrooms,
    required this.unitArea,
    required this.address,
    required this.imageUrl,
    required this.datePosted,
    required this.resourceLink,
    required this.developerPortfolio,
    this.description,
    required this.isFavorite,
    required this.isFeatured,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    String dateString = json['datePosted'] ?? '';
    DateTime parsedDate;

    try {
      parsedDate = DateTime.parse(dateString);
    } catch (e) {
      parsedDate = DateTime(1970, 1, 1);
    }

    List<String> imageUrls = [];
    if (json['images'] != null && json['images'] is List) {
      imageUrls = List<String>.from(json['images'].map(
            (imgPath) => "https://propertyapi.runasp.net$imgPath",
      ));
    }

    return UnitModel(
      isFeatured: json['isFeatured'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
      description : json['description'],
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      price: json['price'] ?? 0,
      numOfRooms: json['numberOfBedrooms'] ?? 0,
      numOfBathrooms: json['numberOfBathrooms'] ?? 0,
      unitArea: json['unitArea'] ?? 0,
      address: json['address'] ?? '',
      imageUrl: imageUrls,
      datePosted: parsedDate,
      resourceLink: json['resourceLink'] ?? '',
      developerPortfolio: json['developerPortfolio'] is String ? json['developerPortfolio'] : null,

    );
  }
}
