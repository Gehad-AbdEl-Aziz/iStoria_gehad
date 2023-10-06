import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://my-json-server.typicode.com',
        receiveDataWhenStatusError: true,
        followRedirects: false,
      ),
    );

    dio!.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }
}
