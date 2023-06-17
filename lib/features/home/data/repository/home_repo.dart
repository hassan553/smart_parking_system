import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spark/core/constants/firebase_constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:spark/features/home/data/model/place_model.dart';

class HomeRepo {
  Future<Either<String, Map<String, dynamic>?>> _getAllPlaces() async {
    try {
      final places = <String, dynamic>{};
      final result =
          await firebaseFirestore.collection('places').doc('right').get();
      places.addAll(result.data()!);
      return right(places);
    } catch (error, stackTrace) {
      return left('$error\n$stackTrace');
    }
  }

  Future<Either<String, List<PlaceModel>?>> getRightPlaces() async {
    try {
      final places = <PlaceModel>[];
      final result = await _getAllPlaces();

      return result.fold(
        (left) => Left(left),
        (right) {
          final res = right!['right'] as List;
          places.addAll(
              res.map((element) => PlaceModel.fromJson(element)).toList());

          return Right(places);
        },
      );
    } catch (error, stackTrace) {
      return left('$error\n$stackTrace');
    }
  }

  Future<Either<String, List<PlaceModel>?>> getLeftPlaces() async {
    try {
      final places = <PlaceModel>[];
      final result = await _getAllPlaces();

      return result.fold(
        (left) => Left(left),
        (right) {
          final res = right!['left'] as List;
          places.addAll(
              res.map((element) => PlaceModel.fromJson(element)).toList());

          return Right(places);
        },
      );
    } catch (error, stackTrace) {
      return left('$error\n$stackTrace');
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
          .doc(user!.uid)
          .update({'image': imageUrl});
    } catch (error) {
      print(error);
    }
  }
}
