import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/ui/helpers/loader.dart';
import 'package:vakinha_burger/app/core/ui/helpers/messages.dart';

// recebe dois tipos genéricos stateful e blocbase
abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    // solicita a controller para o provider
    controller = context.read<C>();
    // força o carregamendo dos dados apenas após a construção da tela
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
