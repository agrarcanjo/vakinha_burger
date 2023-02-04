import 'package:intl/intl.dart';

extension FormatterExtension on double {
  String get currencyPTBR {
    final currencyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      // faz com que seja literal o simbolo
      symbol: r'R$',
    );
    return currencyFormat.format(this);
  }
}
