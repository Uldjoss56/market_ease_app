import 'package:dio/dio.dart';

class Api {
  static api() {
    final options = BaseOptions(
      baseUrl: 'https://marketease.gptiybf.com/api/',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

    return Dio(options);
  }
}
