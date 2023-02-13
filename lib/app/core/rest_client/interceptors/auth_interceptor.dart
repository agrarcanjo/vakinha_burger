import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakinha_burger/app/core/global/global_context.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // trata a expiração de login em um navigator global pois aqui não tem contexto (não usa GETContext)
      GlobalContext.i.loginExpire();
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}
