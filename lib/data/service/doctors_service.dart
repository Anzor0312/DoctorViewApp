import 'package:dio/dio.dart';
import 'package:doctorapp/core/config/dio_config.dart';
import 'package:doctorapp/core/config/dio_error_config.dart';
import 'package:doctorapp/core/config/network_config.dart';
import 'package:doctorapp/data/model/doctors_model.dart';

class DoctorsService {
  Future<NetworkResponse> getDoctorsData() async {
    try {
      Response response =
          await DioConfig.createRequest().get("http://192.168.151.3:4000/data");
      if (response.statusCode == 200) {
        return NetworkSucceedResponse(
            DoctorsModel.fromJson(response.data));
      } else {
        return NetworkHttpErrorResponse(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return NetworkExceptionResponse(DioErrorConfig.catchError(e));
    }
  }
}
