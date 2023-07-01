import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spark/core/constants/firebase_constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:spark/features/home/data/model/place_model.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';

class HomeRepo {
  Future bookedPlace() async {
     final response = await http.put(url,body: jsonEncode({
      
     }));
  }
  Future<List<PlaceModel>> getPlacesData() async {
    print('in');
    try {
      final response = await http.get(url);
      final r =
          jsonDecode(response.body)['-NYiltRSUG2JeXvXDIds']['places'] as List;

      List<PlaceModel> places = [];
      print('o');
      r.forEach(
        (element) {
          print(element);
          places.add(PlaceModel.fromJson(element));
        },
      );
      print(places);
      return places;
    } catch (error) {
      return [];
    }
  }
  Future<void> updatePlaceData(int placeId, bool newValue) async {
  try {
    final response = await http.get(url);
    final responseData = jsonDecode(response.body);

    // Retrieve the places node
    final placesNode = responseData['-NYiltRSUG2JeXvXDIds']['places'];

    // Find the place with the specified placeId
    final placeToUpdate = placesNode.firstWhere((place) => place['id'] == placeId);

    // Update the desired value
    placeToUpdate['isBooked'] = newValue;

    // Prepare the updated data
    final updatedData = jsonEncode(responseData);

    // Perform the update request
    await http.put(url, body: updatedData);

    print('Place data updated successfully');
  } catch (error) {
    print('Failed to update place data: $error');
  }
}

}

class ImageUploading {
  Future<void> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = path.basename(imageFile.path);
      firebase_storage.Reference firebaseStorageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      await firebaseStorageRef.putFile(imageFile);
      String imageUrl = await firebaseStorageRef.getDownloadURL();
      print('Image URL: $imageUrl');
      updateUserImage(imageUrl);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getImageAndUpload(BuildContext context, bool isCamera) async {
    final picker = ImagePicker();
    var pickedFile;
    if (isCamera) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      await uploadImageToFirebase(imageFile);
    } else {}
  }

  Future updateUserImage(String imageUrl) async {
    try {
      firebaseFirestore
          .collection('users')
          .doc(user)
          .update({'image': imageUrl});
    } catch (error) {
      print(error);
    }
  }
}
