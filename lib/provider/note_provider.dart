import 'package:flutter/foundation.dart';

class NoteProvider extends ChangeNotifier{
  List<String> _noteList = [];

  List<String> get noteList => _noteList;

  void addNote(String value){
    noteList.add(value);
    notifyListeners();
  }

}