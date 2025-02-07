import 'package:dio/dio.dart';
import 'package:docdoc_app/core/helpers/constant.dart';
import 'package:docdoc_app/core/helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeader();
      return dio!;
    } else {
      return dio!;
    }
  }
static void addDioHeader() {
    dio?.options.headers={
      "Accept": "application/json",
      "Authorization": "Bearer ${SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}",
    };
}

static void setTokenAfterLogin(String token) {
  dio?.options.headers={
    "Authorization": "Bearer $token",
  };
}
  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}