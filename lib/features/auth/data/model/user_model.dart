import 'package:flutter/animation.dart';

class UserModel {
  String? name;
  String? email;
  String? image;
  CarModel? carModel;
  UserModel({this.carModel, this.email, this.image, this.name});
  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
        name: json!['name'], email: json['email'], image: json['image']);
  }
  Map<String,dynamic> toMap() {
    return {'name': name, 'image': image, 'email': email, 'carModel': carModel};
  }
}

class CarModel {
  Color? color;
  String? model;
  String? number;
  CarModel({
    this.color,
    this.model,
    this.number,
  });
  factory CarModel.fromJson(Map json) {
    return CarModel(
        color: json['color'], model: json['model'], number: json['number']);
  }
  Map<String, dynamic> toMap() {
    return {'number': number, 'model': model, 'color': color};
  }
}
