import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier{
   String _likeCount = "215";

  String get likeCount => _likeCount;

  void changeLikeCount(String value){
    _likeCount = value;
    notifyListeners();
  }

  int _commentCount = 10;
  int get commentCount => _commentCount;

  void changeCommentCount(int value){
    _commentCount = _commentCount + value;
    notifyListeners();
  }

   List<String> storyImage = [
     'assets/images/image1.jpg',
     'assets/images/image2.jpg',
     'assets/images/image3.jpg',
     'assets/images/image4.jpg',
     'assets/images/image5.jpg',
     'assets/images/image6.jpg',
     'assets/images/image7.jpg',
     'assets/images/image8.jpg',
     'assets/images/image9.jpg',
     'assets/images/image10.jpg',
   ];

  List<String> _commentList = [
    "Beautiful shot!",
    "Absolutely stunning!",
    "Love this!",
    "Wow, amazing capture!",
    "Fantastic photo!",
    "So mesmerizing!",
    "This is everything!",
    "Obsessed with this!",
    "Brilliant work!",
    "Wow, amazing capture!",
  ];

  List<String> get commentList => _commentList;

  void addComment(String value){
    _commentList.insert(0, value);
    notifyListeners();
  }
}