
import 'package:dio/dio.dart';
// import 'pretty_dio_logger.dart';

class DioProvider {
  static const basUrl = "https://proferoni-admin.dbu.setuptech.dev/";
  static Dio? _instance;
  

  static final BaseOptions _options = BaseOptions(
    baseUrl: basUrl, 
    connectTimeout: Duration(seconds: 60),
    receiveTimeout: Duration(seconds: 60),
  );


}