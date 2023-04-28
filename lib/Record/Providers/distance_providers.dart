import 'package:flutter/cupertino.dart';

class Distance with ChangeNotifier {
  String _distance = '0';
  String get dist => _distance;

  void updatedistance(String distance) {
    _distance = distance;
    notifyListeners();
  }
  
}
