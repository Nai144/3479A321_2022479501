import 'package:flutter/foundation.dart';

class AppData extends ChangeNotifier {
  // Variables privadas
  int _counter = 0;
  final List<String> _actions = [];

  int get counter => _counter;

  List<String> get actions => _actions;

  void incrementCounter() {
    _counter++;
    _actions.add('Incremento a $_counter');
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      _actions.add('Decremento a $_counter');
      notifyListeners();
    }
  }
}