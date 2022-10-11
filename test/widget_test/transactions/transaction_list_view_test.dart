import 'package:everest_flutter_crypto_tests/l10n/app_localizations.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/list_tile_transactions.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/list_view_transactions.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/transaction_modal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN tapped on ListView of TransactionsPage, THEN find ListView',
    (WidgetTester tester) async {
      final userTransactions = [
        FakeData.createTransactionModel(),
      ];
      await loadPage(
          tester,
          ListViewTransactions(
            userTransactions: userTransactions,
          ));

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTileTransactions), findsOneWidget);
    },
  );
  testWidgets(
    'WHEN tapped on ListTile of TransactionsPage, THEN show ModalBottomSheet',
    (WidgetTester tester) async {
      await loadPage(
          tester,
          ListTileTransactions(
              formattedDate: '',
              userTransaction: FakeData.createTransactionModel()));

      await tester.pumpAndSettle();

      expect(find.byType(Expanded), findsWidgets);
      expect(find.byType(TransactionModalDetails), findsNothing);
      await tester.tap(find.byType(ListTile));
      await tester.pump();
      expect(find.byType(TransactionModalDetails), findsOneWidget);
    },
  );
}
