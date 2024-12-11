import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RatingProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _comfortable = 0;
  int _driving = 0;
  int _talking = 0;
  String _comments = '';

  int get comfortable => _comfortable;
  int get driving => _driving;
  int get talking => _talking;
  String get comments => _comments;

  void setComfortable(int value) {
    _comfortable = value;
    notifyListeners();
  }

  void setDriving(int value) {
    _driving = value;
    notifyListeners();
  }

  void setTalking(int value) {
    _talking = value;
    notifyListeners();
  }

  void setComments(String value) {
    _comments = value;
    notifyListeners();
  }
}