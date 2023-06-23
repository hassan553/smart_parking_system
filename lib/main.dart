import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark/app/my_app.dart';
import 'package:spark/features/home/data/repository/home_repo.dart';
import 'core/screvice_locator/screvices.dart';
import 'features/home/views/details_view.dart';
import 'features/home/views/timer_view.dart';

late SharedPreferences sharedPreferences;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // sharedPreferences = await SharedPreferences.getInstance();
  // await ServicesLector.init();
  // await Firebase.initializeApp();
  runApp(const TestApp());
}

void setOrientations() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:TimerView(),
      ),
    );
  }
}
//left -NYMtBORAD-8W2Y3OzO_
//right -NYMswFVKTb03yuoD0dg
List<Map<String, dynamic>> leftList = [
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': false,
    'title': 'P-02'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': false,
    'title': 'P-04'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': true,
    'title': 'P-06'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': true,
    'title': 'P-08'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': true,
    'title': 'P-10'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': true,
    'title': 'P-12'
  }
];

List<Map<String, dynamic>> rightList = [
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': true,
    'title': 'P-01'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': true,
    'title': 'P-03'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': true,
    'title': 'P-05'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': false,
    'title': 'P-07'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': false,
    'title': 'P-09'
  },
  {
    'description': 'P-2 is the second place to the right of the entrance',
    'isBooked': false,
    'title': 'P-11'
  }
];
