
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class RegisterRepository {
  Future<Either<String, UserCredential>> register(
      {required String email,
      required String password,

      required String name
      });
}

class RegisterRepositoryImpl extends RegisterRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<Either<String, UserCredential>> register({
    required String email,
    required String password,

    required String name,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // UserModel userModel = UserModel(
      //     name: 'name', image: image, email: email, token: _auth.currentUser!.uid);

      // await FirebaseStorage.instance
      //     .collection('users').doc(_auth.currentUser!.uid)
      //     .set({});
      return right(result);
    } catch (error) {
      return left('Oops an Error.Try again');
    }
  }
}
