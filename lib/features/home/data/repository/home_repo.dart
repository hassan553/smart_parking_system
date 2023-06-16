import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/api.dart';
import '../../../auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  Future<Either<String, UserModel>> getUserProfile(String token) async {
    try {
      http.Response response = await http.get(profileUrl, headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        "Authorization": token
      });

      return right(UserModel.fromJson(json.decode(response.body)));
    } catch (error) {
      return left(error.toString());
    }
  }

  // final ImagePicker _picker = ImagePicker();
  // String? _imageFile;
  // void _pickImage() async {
  //   try {
  //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //     _imageFile = pickedFile!.path;
  //   } catch (e) {
  //     print("Image picker error " + e.toString());
  //   }
  // }
  File? file;
  final ImagePicker _picker = ImagePicker();
  Future chooseImage() async {
    file = (await _picker.pickImage(source: ImageSource.camera)) as File?;
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  void uploadImage(String token) {
    if (file == null) return;
    String base64Image = base64Encode(file!.readAsBytesSync());
    String fileName = file!.path.split("/").last;

    http.put(
      updateProfileUrl,
      body:  json.encode(
        {
          "image": base64Image,
         
        },
      ),
      headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        "Authorization": token
      },
    ).then((res) {
      print(fileName);
    }).catchError((err) {
      print(err);
    });
  }
}
