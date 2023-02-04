import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// mixin roda apenas alguem com State
// recebo um context pois o mixin roda apenas em alguém que já gera um state
mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        builder: (context) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 60,
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
