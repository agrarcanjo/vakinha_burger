import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burger/app/core/rest_client/custom_dio.dart';
import 'package:vakinha_burger/app/repositories/products/auth/auth_repository.dart';
import 'package:vakinha_burger/app/repositories/products/auth/auth_repository_impl.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        // prove a instancia para toda aplicação
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            dio: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
