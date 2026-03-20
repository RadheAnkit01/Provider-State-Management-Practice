import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  // get count value
  int getCount() => _count;

  //increment function
  void incrementCount() {
    _count++;
    notifyListeners();
  }

  //decrement Function
  void decrementCount() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
