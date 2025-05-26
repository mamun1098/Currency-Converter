
import 'package:currency_converter/data/common/dynamic_response.dart';

abstract class TestDatasource {
  //contact us 
  Future <DynamicResponse> ContactUs ({
    required String name,
    required String mail,
    required String message,
    required String phone, 
    required String subject,
  });
}