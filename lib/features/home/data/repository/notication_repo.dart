import 'package:firebase_messaging/firebase_messaging.dart';

class terminated {
  var fcm = FirebaseMessaging.instance;
  Future getUserToken() async {
    final result = await fcm.getToken();
    print(result);
  }

  Future getMassegeInForground() async {
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
    });
  }

  Future getMessageInBackground() async {
    FirebaseMessaging.onBackgroundMessage(m);
  }

  Future m(RemoteMessage message) async {}
//in click on message when app in background
  Future openInBackground() async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('hello');
    });
  }

  //in click on message when app in terminated
  Future openInTerminated() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      print('hassan');
    }
  }
}
