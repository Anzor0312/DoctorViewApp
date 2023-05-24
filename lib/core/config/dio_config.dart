import 'package:dio/dio.dart';

class DioConfig {
 static Dio createRequest() {
    Dio dio = Dio(BaseOptions(
        validateStatus: (int? status) {
          if (status != null) {
            if (status >= 100 && status <= 599) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
        receiveDataWhenStatusError: true));


    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.sendTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 25);

    return dio;
  }
}
