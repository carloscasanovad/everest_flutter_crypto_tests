import 'package:decimal/decimal.dart';

class RegexController {
  static Decimal arrangeNumber(String value) {
    Decimal formattedValue = Decimal.parse(value.replaceAll(RegExp(r','), '.'));
    return formattedValue;
  }
}
