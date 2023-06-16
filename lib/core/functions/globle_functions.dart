import 'package:flutter/material.dart';

Size screenSize(context) {
  return MediaQuery.of(context).size;
}

navigateOff(context, screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) {
        return screen;
      },
    ),
  );
}

navigateTo(context, screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) {
        return screen;
      },
    ),
  );
}

pop(context) {
  Navigator.pop(
    context,
  );
}
