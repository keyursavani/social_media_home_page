import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier{
   String _likeCount = "215";

  String get likeCount => _likeCount;

  void changeLikeCount(String value){
    _likeCount = value;
    notifyListeners();
  }

}