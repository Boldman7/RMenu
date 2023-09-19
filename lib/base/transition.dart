import 'package:flutter/material.dart';

class Transition {
  static Route createPageRoute(Widget page) {
    return MaterialPageRoute(builder: (context) {
      return page;
    });
  }
}
