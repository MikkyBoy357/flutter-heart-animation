import 'package:flutter/material.dart';

class HeartProvider extends ChangeNotifier {
  bool isBeating = false;
  int heartLevel = 1;
  int heartLevel2 = 50;

  void changeFirstHeart() async {
    isBeating = !isBeating;

    if (isBeating) {
      print('Begin Heart Beat');
      while (isBeating) {
        /// HeartLevel2
        for (int i = 50; i >= 0; i--) {
          print('HeartLevel2 i => $i');
          heartLevel2 = i;
          notifyListeners();
          await Future.delayed(Duration(milliseconds: 10));
          if (!isBeating) return print('Heart Beat terminated');
        }
        for (int i = 0; i < 50; i++) {
          print('HeartLevel2 i => $i');
          heartLevel2 = i;
          notifyListeners();
          await Future.delayed(Duration(milliseconds: 10));
          if (!isBeating) return print('Heart Beat terminated');
        }

        /// HeartLevel
        for (int i = 0; i < 50; i++) {
          print('i => $i');
          heartLevel = i;

          notifyListeners();
          await Future.delayed(Duration(milliseconds: 5));
          if (!isBeating) return print('Heart Beat terminated');
        }
        for (int i = 50; i >= 0; i--) {
          print('i => $i');
          heartLevel = i;
          notifyListeners();
          await Future.delayed(Duration(milliseconds: 5));
          if (!isBeating) return print('Heart Beat terminated');
        }
      }
      isBeating = false;
    } else {
      print('Stop Heart Beat');
      heartLevel = 0;
      heartLevel2 = 50;
      notifyListeners();
    }
    notifyListeners();
  }
}
