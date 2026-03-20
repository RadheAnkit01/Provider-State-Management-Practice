import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];

  //events

  //add data
  void addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }

  //Update Data
  void updateData(Map<String, dynamic> updatedData, int index) {
    _mData[index] = updatedData;
    notifyListeners();
  }

  //Delete Data
  void deleteData(int index) {
    _mData.removeAt(index);
    notifyListeners();
  }

  //get data
  List<Map<String, dynamic>> getData() {
    return _mData;
  }

  //
}
