import 'package:flutter/material.dart';
import '../model/doubleball.dart';
import 'dart:convert';
import '../utils/utils.dart';

class DoubleListProvide with ChangeNotifier{
  List<DoubleBallData> doubleball=[];

  getDouleBallList(){
    var responseData = json.decode(getDouleBalls(5).toString());
    DoubleBallModel doubleballModel = DoubleBallModel.fromJson(responseData);
    doubleball = doubleballModel.data;
    notifyListeners();
  }
}