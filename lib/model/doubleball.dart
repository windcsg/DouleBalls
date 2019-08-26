class DoubleBallModel {
  bool _success;
  int _code;
  List<DoubleBallData> _data;
  String _message;

  DoubleBallModel({bool success, int code, List<DoubleBallData> data, String message}) {
    this._success = success;
    this._code = code;
    this._data = data;
    this._message = message;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  int get code => _code;
  set code(int code) => _code = code;
  List<DoubleBallData> get data => _data;
  set data(List<DoubleBallData> data) => _data = data;
  String get message => _message;
  set message(String message) => _message = message;

  DoubleBallModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _code = json['code'];
    if (json['data'] != null) {
      _data = new List<DoubleBallData>();
      json['data'].forEach((v) {
        _data.add(new DoubleBallData.fromJson(v));
      });
    }
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['message'] = this._message;
    return data;
  }
}

class DoubleBallData {
  String _red;
  int _blue;

  DoubleBallData({String red, int blue}) {
    this._red = red;
    this._blue = blue;
  }

  String get red => _red;
  set red(String red) => _red = red;
  int get blue => _blue;
  set blue(int blue) => _blue = blue;

  DoubleBallData.fromJson(Map<String, dynamic> json) {
    _red = json['red'];
    _blue = json['blue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['red'] = this._red;
    data['blue'] = this._blue;
    return data;
  }
}
