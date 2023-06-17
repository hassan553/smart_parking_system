class PlaceModel {
  final String title;
  final String description;
  final bool isBooked;
  const PlaceModel({
    required this.description,
    required this.isBooked,
    required this.title,
  });
  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
        description: json['description'],
        isBooked: json['isBooked'],
        title: json['title']);
  }
  Map toJson() {
    return {'description': description, 'isBooked': isBooked, 'title': title};
  }
}
