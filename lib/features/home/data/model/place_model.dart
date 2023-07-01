class PlaceModel {
  final String title;
  final String description;
  final bool isBooked;
  final int id;
  const PlaceModel({
    required this.description,
    required this.isBooked,
    required this.title,
    required this.id,
  });
  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
        description: json['description'],
        isBooked: json['isBooked'],
        title: json['title'],
        id:json['id']);
  }
  Map toJson() {
    return {'description': description, id:'id','isBooked': isBooked, 'title': title};
  }
}
