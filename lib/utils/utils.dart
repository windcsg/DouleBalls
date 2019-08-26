import 'dart:math';
import 'dart:convert';

String getDouleBalls(int number) {
  var map = new Map();
  List data = [];
  
  map["success"] = true;
  map["code"] = 200;
  for (var i = 0; i < number; i++) {
    int blue = Random().nextInt(16);
    Map mapData = new Map();
    List<int> red = [];
    String reds = '';
    for (var i = 0; i < 6; i++) {
      while (true) {
        int index = Random().nextInt(32);
        if (index != 0 || red.lastIndexOf(index) > 0) {
          red.add(index);
          break;
        }
      }
    }
    red.sort((num1, num2) => num1 - num2);
    for (var i = 0; i < red.length; i++) {
      if (reds == '') {
        reds = '${red[i]}';
      } else {
        reds = '${reds},${red[i]}';
      }
    }
    mapData['red'] = reds;
    mapData['blue'] = blue;
    data.add(mapData);
  }
  map['data'] = data;
  String str = jsonEncode(map);
  return str;
}
