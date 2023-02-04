import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/ui/base_state/base_state.dart';
import 'package:vakinha_burger/app/core/ui/helpers/loader.dart';
import 'package:vakinha_burger/app/core/ui/helpers/messages.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burger/app/pages/home/home_controller.dart';
import 'package:vakinha_burger/app/pages/home/home_state.dart';
import 'package:vakinha_burger/app/pages/home/widgets/delivery_product_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Adiciona o mixin, passando o State/context
class _HomePageState extends BaseState<HomePage, HomeController> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     context.read<HomeController>().loadProducts();
  //     ou -> controller.loadProducts();
  //   });
  // }

  @override
  // chama a classe abstrata para tratar o carregamento de itens pós carregamento de tela
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   showLoader();
      // }),
      // Controla o state
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          // pacote match faz o tratamento dos state
          state.status.matchAny(
            // quando o state for qualquer coisa, esconda o loader
            any: () => hideLoader(),
            // quando o state for loading, mostre o loader
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro não informado');
            },
          );
        },
        // controla quando vai build a tela
        buildWhen: (previous, current) => current.status.matchAny(
          // se for qualquer coisa fora do especificado, não build a tela
          any: () => false,
          initial: () => true,
          loaded: () => true,
          // quando for loading eu quero que faça nada.
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return DeliveryProductTitle(
                      product: product,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
