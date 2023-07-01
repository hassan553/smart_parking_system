import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/firebase_constants.dart';


abstract class LoginRepository {
  Future<Either<String, String >> login(String email, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<Either<String, String>> login(
      String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(result.user!.uid);
    } catch (error) {
      return left('Oops an Error. Try again');
    }
  }
}
