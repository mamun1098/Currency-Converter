
import 'package:currency_converter/data/common/dynamic_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestRepository {
  final Dio _dio = Dio();

  Future <Response> postRequest (Map<String, dynamic> data) async{
    final url = "https://webhook.site/5008c867-c1a7-4c40-882a-3d9c75580860";
    
    

    try {
      final response = await _dio.post(
        url,
        data: data, 
        options: Options(headers: {'content-Type': 'application/json'})
      );
      return response;
    } catch (e){
      print("error $e");
      rethrow;
    }
  }
}