import 'package:decimal/decimal.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/controllers/regex_controller.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/model/transactions_model.dart';
import 'package:everest_flutter_crypto_tests/shared/api/model/crypto_data_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'WHEN RegexController.arrageNumber is used, THEN ensure that the result will be Decimal without ,',
      () {
    String test = '22,5';
    String test2 = '512,5';

    expect(RegexController.arrangeNumber(test), Decimal.parse('22.5'));
    expect(RegexController.arrangeNumber(test2), Decimal.parse('512.5'));
  });
}
