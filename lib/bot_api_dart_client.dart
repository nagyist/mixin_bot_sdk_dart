import 'package:dio/dio.dart';

class Client {
  Dio dio;
  String userId;
  String sessionId;

  Client(String ua, String language, String deviceId) {
    dio = Dio();
    dio.options.baseUrl = 'https://mixin-api.zeromesh.net';
    dio.options.connectTimeout = 10000; // 10s
    dio.options.sendTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers['User-Agent'] = ua;
      options.headers['Accept-Language'] = language;
      options.headers['Mixin-Device-Id'] = deviceId;
      options.headers['Authorization'] = 'Bearer ' + signToken(options);
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (DioError error) async {
      return error;
    }));
  }

  String signToken(RequestOptions options) {
    if (userId == null || sessionId == null) {
      return '';
    } else {
      // Todo sign token
      return '';
    }
  }
}
