import 'package:everest_flutter_crypto_tests/modules/transactions/model/transactions_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TransactionsModel transactionsModel;
  setUp(() {
    transactionsModel = TransactionsModel(
        cryptoBeingExchangedInfo: 'cryptoBeingExchangedInfo',
        cryptoToExchangeInfo: 'cryptoToExchangeInfo',
        date: DateTime(2000),
        exchangeEqualsTo: 'exchangeEqualsTo',
        moneyBeingExchangedInfo: 'moneyBeingExchangedInfo');
  });
  test(
    'WHEN transactionModel is used, THEN make sure that some information are valid',
    () {
      expect(transactionsModel.cryptoBeingExchangedInfo.isNotEmpty, true);
      expect(transactionsModel.date, DateTime(2000));
      expect(transactionsModel.exchangeEqualsTo.isNotEmpty, true);
      expect(transactionsModel.moneyBeingExchangedInfo.contains('money'), true);
    },
  );
}
