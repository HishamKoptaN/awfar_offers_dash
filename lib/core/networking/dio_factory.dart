import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Future<Dio> setupDio() async {
    Duration timeOut = const Duration(seconds: 15);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        };
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void setTokenIntoHeader({
    required String? token,
  }) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    addDioInterceptor();
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
