import 'package:flutter/cupertino.dart';

class Drowsiness with ChangeNotifier {
  String _drowsiness = '0';
  String get drow => _drowsiness;

  void updatedrowsiness(String drowsy) {
    _drowsiness = drowsy;
    notifyListeners();
  }
}
