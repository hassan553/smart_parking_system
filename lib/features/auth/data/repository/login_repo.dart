import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/api.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

abstract class LoginRepository {
  Future<Either<String, UserCredential>> login(String email, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<Either<String, UserCredential>> login(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(result);
    } catch (error) {
      return left('Oops an Error. Try again');
    }
  }
}
