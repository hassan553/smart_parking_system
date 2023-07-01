import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spark/main.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
String? user = sharedPreferences.getString('userId');
String? isBooked = sharedPreferences.getString('isBooked');
Uri url =
    Uri.parse('https://rakna-3da8c-default-rtdb.firebaseio.com/places.json');
