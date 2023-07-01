import 'dart:async';
import 'package:get/get.dart';
import 'package:spark/main.dart';

class TimerController extends GetxController {
  late Timer timer;
  int minutes = 0;
  int hours = 0;

  @override
  void onInit() {
    super.onInit();
    loadTimerValues(); // Load timer values from persistent storage
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setTimer();
    });
  }

  void setTimer() {
    minutes++;
    if (minutes == 60) {
      hours++;
      minutes = 0;
    }
    saveTimerValues(); // Save timer values to persistent storage
    print(minutes);
    update();
  }

  Future<void> loadTimerValues() async {
    minutes = sharedPreferences.getInt('minutes') ?? 0;
    hours = sharedPreferences.getInt('hours') ?? 0;
  }

  Future<void> saveTimerValues() async {
    await sharedPreferences.setInt('minutes', minutes);
    await sharedPreferences.setInt('hours', hours);
  }

  cancelsTimer()async {
    timer.cancel();
    await sharedPreferences.setInt('minutes', 0);
    await sharedPreferences.setInt('hours', 0);
  }

  @override
  void onClose() {
    // Called when the controller is no longer needed
    // Do not dispose the timer here
    super.onClose();
  }
}
