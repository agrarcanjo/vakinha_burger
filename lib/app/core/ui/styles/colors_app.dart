import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

//instanciação do singleton
  static ColorsApp get i {
    //se for null, instancia a primeira vez
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF007D21);
  Color get secondary => const Color(0XFFF88B0C);
}

// cria um alias para Colors
extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
