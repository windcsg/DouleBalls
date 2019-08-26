import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

//封装Dio的GET、POST方法
Future request(url, method, {formData}) async {
  try {
    print('开始获取数据......>>>>>>>>>');
    Response response;
    Dio dio = Dio();
      Options options = Options(
      headers: {
        'Content-Type': 'application/json'
      },
      // contentType: ContentType.parse('application/json')
    );
    if (method == 'GET') {
      if (formData == null) {
        response = await dio.get(servicePath[url], options: options);
      } else {
        response = await dio.get(servicePath[url], queryParameters: formData, options: options);
      }
    } else if (method == 'POST') {
      if (formData == null) {
        response = await dio.post(servicePath[url], data: formData, options: options);
      } else {
        response = await dio.post(servicePath[url], data: formData, options: options);
      }
    }else{
      throw Exception('参数异常，已登记到系统日志');
    }
    if (response.data['code'] == 200) {
      return response;
    }else{
      return response;
      // throw Exception('后端接口出现异常。');
    }
    
    
    
  } catch (e) {
    return print('ERROR:============>${e}');
  }
}