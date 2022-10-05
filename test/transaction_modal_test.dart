import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/transaction_modal_details.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/transaction_modal_details_body.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/transaction_modal_details_header.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  testWidgets(
    'WHEN TransactionModal is open, THEN find header and body information',
    (WidgetTester tester) async {
      Map<String, String> transactionDetails = {
        faker.guid.guid(): faker.guid.guid(),
      };
      await loadPage(
          tester,
          TransactionModalDetails(
              formatedDateTime: '', transactionDetails: transactionDetails));

      await tester.pumpAndSettle();

      final mainPadding = tester.widget<Padding>(find.byType(Padding).first);
      expect(mainPadding.padding.horizontal, 60);
      expect(mainPadding.padding.vertical, 40);

      expect(find.byType(TransactionModalDetailsHeader), findsOneWidget);
      expect(find.byType(TransactionModalDetailsBody), findsOneWidget);
    },
  );
}
