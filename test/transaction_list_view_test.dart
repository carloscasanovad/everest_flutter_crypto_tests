import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/list_tile_transactions.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/transaction_modal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/fake_data.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  testWidgets(
    'WHEN tapped on ListTile of TransactionsPage, THEN show ModalBottomSheet',
    (WidgetTester tester) async {
      FakeData fakeData = FakeData();
      await loadPage(
          tester,
          ListTileTransactions(
              formattedDate: '',
              userTransaction: fakeData.createTransactionModel()));

      await tester.pumpAndSettle();

      expect(find.byType(TransactionModalDetails), findsNothing);
      await tester.tap(find.byType(ListTile));
      await tester.pump();
      expect(find.byType(TransactionModalDetails), findsOneWidget);
    },
  );
}
