
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_app/constant.dart';


class DioHelper
{
  static Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers:
        {
          'Content-Type':'application/json',
        }
      )
    );
  }

  static Future<Response> getData({
  @required String url,
    dynamic query,
    String token,
}) async
  {
    dio.options.headers = {
      'Authorization' : token,
    };
    return await dio.get(url, queryParameters: query);
  }



  static Future<Response> postData({
    @required String url,
    @required Map< String , dynamic > data,
    Map< String , dynamic > query,
    String token,
})async
  {
    dio.options.headers = {
      'Authorization' : token,
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}

