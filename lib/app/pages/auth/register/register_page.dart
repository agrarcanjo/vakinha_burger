import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_button.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              child: Column(
            children: [
              Text(
                'Cadastro',
                style: context.textStyles.textTitle,
              ),
              Text(
                'Preencha os campos abaixo para criar o seu cadastro.',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: Validatorless.required('Nome Obrigatório'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail Obrigatório'),
                  Validatorless.email('E-mail Obrigatório'),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: Validatorless.multiple([
                  Validatorless.required('Senha Obrigatório'),
                  Validatorless.min(
                      6, 'A senha deve ter no mínimo 6 caracteres'),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Confirme a Senha'),
                validator: Validatorless.multiple([
                  Validatorless.required('Confirmação de Senha Obrigatório'),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: DeliveryButton(
                  label: 'Cadastrar',
                  onPressed: () {},
                  width: double.infinity,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
