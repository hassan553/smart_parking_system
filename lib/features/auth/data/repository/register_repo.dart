import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../core/constants/firebase_constants.dart';
import '../model/user_model.dart';

abstract class RegisterRepository {
  Future<Either<String, UserCredential>> register(
      {required String email, required String password, required String name});

  Future<Either<String, String>> createCarInfo(
      {required String model, required String number, required String color});
}

class RegisterRepositoryImpl extends RegisterRepository {
 
  @override
  Future<Either<String, String>> createCarInfo(
      {required String model,
      required String number,
      required String color}) async {
    try {
      firebaseFirestore
          .collection('users')
          .doc(user!.uid)
          .collection('cars')
          .add({'carName': model, 'carNumber': number, 'carColor': color});
      return right('Successfully Saved  car information');
    } catch (error) {
      print('carr ${error.toString()}');
      return left('Oops an Error.Try again');
    }
  }

  @override
  Future<Either<String, UserCredential>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel = UserModel(
          name: name, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWExOnUzueyinId7RyD4JOuTDrXPlLgnxH4Q&usqp=CAU', email: email);

      await firebaseFirestore
          .collection('users').doc(auth.currentUser!.uid)
          .set(userModel.toMap());
      return right(result);
    } catch (error) {
      return left('Oops an Error.Try again');
    }
  }
}
class t{
  FirebaseMessaging fb=FirebaseMessaging.instance;

  void send()async{
   String? token=await fb.getToken();
   print(token);
 }
 void onMessage(){
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data['name']);
    });
 }
}