import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/delivery_app.dart';

import 'app/core/config/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const DeliveryApp());
}

// SENHA
// 5xzN
// mvvBYJ3XWaGLxB55rhN9


