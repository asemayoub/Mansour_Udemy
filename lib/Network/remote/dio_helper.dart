// هنا هنبدا نظبط اعدادات باكدج دييو عشان نستدعي ال api

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {

  static Dio? dio;

  // Create Static Object From Dio

  static init() {

    // هنا انا بعرف ال Dio داخل الميثود بتاعه انشاءه

    dio = Dio(

      // // Base Option : مسئولة ان احط بيانات ال API
      // بداخلها

      BaseOptions(

        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,




      ),





    );

  }


static Future<Response?> getData  ({

  required url,

  required Map<String, dynamic> query,




}) async {


   return await  dio?.get(url,queryParameters: query);



}


}