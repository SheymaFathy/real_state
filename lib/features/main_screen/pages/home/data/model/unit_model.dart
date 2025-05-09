class UnitModel {
  final int id;
  final String title;
  final String type;
  final int price;
  final int numOfRooms;
  final int numOfBathrooms;
  final int unitArea;
  final String address;
  final String imageUrl;
  final DateTime datePosted;
  final String resourceLink;

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
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    String dateString = json['datePosted'] ?? '';
    DateTime parsedDate;

    try {
      parsedDate = DateTime.parse(dateString);
    } catch (e) {
      parsedDate = DateTime(1970, 1, 1);
    }

    return UnitModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      price: json['price'],
      numOfRooms: json['numberOfBedrooms'],
      numOfBathrooms: json['numberOfBathrooms'],
      unitArea: json['unitArea'],
      address: json['address'],
      imageUrl: (json['images'] != null && json['images'].isNotEmpty)
          ? "https://propertyapi.runasp.net${json['images'][0]}"
          : "",
      datePosted: parsedDate,
      resourceLink: json['resourceLink'] ?? '',
    );
  }
}
