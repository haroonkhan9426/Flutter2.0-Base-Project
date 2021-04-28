import 'package:dio/dio.dart';
import 'package:f2_base_project/core/services/auth_service.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';

import '../../locator.dart';

class ApiServices {
  Dio launch() {
    final accessToken = locator<AuthService>().accessToken;
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
//    if (token != null) dio.options.headers["Authorization"] = 'Bearer $token';
//    SharedPreferencesProvider().getToken().then((value) {
//      print("bearer token load $value");
//      if (value != null) dio.options.headers["Authorization"] = 'Bearer $value';
//    });

    if (accessToken != null)
      dio.options.headers["Authorization"] = 'Bearer $accessToken';
    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null)
        return s < 500;
      else
        return false;
    };

    return dio;
  }
}
