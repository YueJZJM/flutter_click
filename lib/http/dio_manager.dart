import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterweibo/constant/constant.dart';

class DioManager{
  //写一个单例
  //在 Dart 里，带下划线开头的变量是私有变量
  static DioManager _instance;

  static DioManager getInstance() {
    if (_instance == null) {
      _instance = DioManager();
    }
    return _instance;
  }


  Dio dio = new Dio();
  DioManager() {
    dio.options.baseUrl = Constant.baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(LogInterceptor(responseBody: true)); //是否开启请求日志
    //  dio.interceptors.add(CookieManager(CookieJar()));//缓存相关类，具体设置见https://github.com/flutterchina/cookie_jar
  }

  //post请求
  post(String url, params, Function successCallBack,
      Function errorCallBack) async {
    _requestHttp(url, successCallBack, "post", params, errorCallBack);
  }

   _requestHttp(String url, Function successCallBack,
      [String method, FormData params, Function errorCallBack]) async {
    Response response;
    try{
      if("post" == method) {
        if(params!=null && params.fields!=null) {
          response = await dio.post(url,data: params);
        }
      }
    } on DioError catch(error){
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 201);
      }
      // debug模式才打印
      if (Constant.ISDEBUG) {
        print('请求异常: ' + error.toString());
      }
      _error(errorCallBack, error.message);
      return '';
    }

    // debug模式打印相关数据
    if (Constant.ISDEBUG) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }

    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['status'] != 200) {
      _error(errorCallBack, dataMap['msg'].toString());
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
   }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }

}
