import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              //empurra a imagem para o fim da tela
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  // estica imagem para caber toda na tela
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //o widget que está em baixo, é o que fica por cima na Stack
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.30),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                    label: 'ACESSAR',
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                    height: 35,
                    width: context.percentWidth(.6),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
