import 'package:flutter/cupertino.dart';

class Pause with ChangeNotifier {
  bool _isPaused = true;
  bool get p => _isPaused;

  void paused(bool pause) {
    _isPaused = pause;
    notifyListeners();
  }
  
}
