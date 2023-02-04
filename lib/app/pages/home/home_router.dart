import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burger/app/pages/home/home_controller.dart';
import 'package:vakinha_burger/app/pages/home/home_page.dart';
import 'package:vakinha_burger/app/repositories/products/products_repository.dart';
import 'package:vakinha_burger/app/repositories/products/products_repository_impl.dart';

class HomeRouter {
  HomeRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
              // injeta o CustomDio com a rota aqui
              dio: context.read(),
            ),
          ),
          // cria intancias de Controller para ser utilizada na Page
          Provider(
            // deve receber um repository que já está instanciado
            create: (context) => HomeController(context.read()),
          )
        ],
        child: const HomePage(),
      );
}
