import 'package:dio/dio.dart';

import 'auth.dart';
import 'mixin.dart';
import 'vo/mixin_response.dart';

class Client {
  Mixin mixin = Mixin();

  Dio dio;
  String userId;
  String sessionId;

  Client(String ua, [String userId, sessionId, privateKey]) {
    dio = Dio();
    dio.options.baseUrl = 'https://api.mixin.one';
    dio.options.connectTimeout = 10000; // 10s
    dio.options.sendTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      final body = (options.data ?? '').toString();
      options.headers['User-Agent'] = ua;
      options.headers['Accept-Language'] = 'en_US';
      options.headers['Authorization'] = 'Bearer ' +
          signAuthenticationToken(
            userId ?? mixin.userId,
            sessionId ?? mixin.sessionId,
            privateKey ?? mixin.privateKey,
            options.method,
            options.path,
            body,
          );
      return options;
    }, onResponse: (Response response) async {
      return MixinResponse.fromJson(response.data);
    }, onError: (DioError error) async {
      return error;
    }));
  }
}
