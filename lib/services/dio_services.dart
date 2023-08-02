import 'dart:developer';

import 'package:dio/dio.dart';

 class DioServices{
  Future<dynamic> getMethode(String url)async{
    Dio dio=Dio();
    dio.options.headers["content-type"]='application/json;';
    return await dio.get(
      url ,
      options: Options(responseType: ResponseType.json,
      method: 'Get'),
      

      ).then((responsive){
        log(responsive.toString());
        return responsive;

      });
    
  }
}