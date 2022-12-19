import 'package:flutter/material.dart';

class MyProviderApp extends ChangeNotifier {

  String Q='';
  bool value =false;


  void search(String q) async{

    Q = q;
    notifyListeners();
  }
  void switchh(bool q) async{

    value = q;
    notifyListeners();
  }


}