import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burger/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';

import 'package:vakinha_burger/app/models/product_model.dart';

class DeliveryProductTitle extends StatelessWidget {
  final ProductModel product;

  const DeliveryProductTitle({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          //empurra todos os dados para a fim da lateral da tela
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.name,
                    style:
                        context.textStyles.textExtraBold.copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.description,
                    style:
                        context.textStyles.textRegular.copyWith(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.price.currencyPTBR,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 12,
                      color: context.colors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: product.image,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
