import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vakinha_burger/app/core/exceptions/repository_exception.dart';
import 'package:vakinha_burger/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:vakinha_burger/app/core/rest_client/custom_dio.dart';
import 'package:vakinha_burger/app/models/auth_model.dart';
import 'package:vakinha_burger/app/repositories/products/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Permissão negada', error: e, stackTrace: s);
        throw UnauthorizedExceptions();
      }
      log('Erro ao realizar login do usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login do usuário');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }
}
