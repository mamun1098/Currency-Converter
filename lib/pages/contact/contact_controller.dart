
import 'package:currency_converter/data/repository/test_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class ContactController extends GetxController {
  final TestRepository _repository = TestRepository();
  

    void contactUs (
      {
        required String name,
        required String message,
        required String mail,
        required String phone,
        required String subject,
        // required Function (bool success) onResult, 
        }
    ) async{
      final Map <String, dynamic> data = {
        "name" : name,
        "message" : message, 
        "mail" : mail, 
        "phone" : phone,
        "subject" :  subject,
      };
      await CircularProgressIndicator;

      try{
        final response = await _repository.postRequest(data);
        if(response.statusCode == 200){
          print("Success");
        } else {
          print("Faild");
        }
      } catch (e){
        // rethrow;
        print(e);
        Get.snackbar("Error", "$e");
      }
    }
}

