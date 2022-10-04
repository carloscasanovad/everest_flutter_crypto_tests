import 'package:everest_flutter_crypto_tests/modules/transactions/model/transactions_model.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/list_tile_transactions.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/transaction_modal_details.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(WidgetTester tester,
      {required Map<String, String> transactionDetails}) async {
    var listTileTransactions = SetupWidgetTester(
      child: ListTileTransactions(
        formattedDate: '',
        userTransaction: TransactionsModel(
            cryptoBeingExchangedInfo: faker.guid.guid(),
            cryptoToExchangeInfo: faker.guid.guid(),
            moneyBeingExchangedInfo: faker.guid.guid(),
            exchangeEqualsTo: faker.guid.guid(),
            date: faker.date.dateTime()),
      ),
    );
    await tester.pumpWidget(listTileTransactions);
  }

  testWidgets(
    'WHEN tapped on ListTile of TransactionsPage, THEN show ModalBottomSheet',
    (WidgetTester tester) async {
      Map<String, String> transactionDetails = {
        faker.guid.guid(): faker.guid.guid(),
      };
      await loadPage(tester, transactionDetails: transactionDetails);

      await tester.pumpAndSettle();

      expect(find.byType(TransactionModalDetails), findsNothing);
      await tester.tap(find.byType(ListTile));
      await tester.pump();
      expect(find.byType(TransactionModalDetails), findsOneWidget);
    },
  );
}
