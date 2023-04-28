import 'package:flutter/cupertino.dart';

class Time with ChangeNotifier {
  String _time = '0';
  String get t => _time;

  void updatedistance(String time) {
    _time = time;
    notifyListeners();
  }
}
