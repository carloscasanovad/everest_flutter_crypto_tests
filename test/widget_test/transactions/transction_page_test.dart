import 'package:everest_flutter_crypto_tests/modules/transactions/views/transactions_page.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/list_view_transactions.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN TransactionPage is open, THEN find main widgets',
    (WidgetTester tester) async {
      await loadPage(tester, const TransactionsPage());

      await tester.pumpAndSettle();

      final divider =
          tester.widget<Divider>(find.byKey(const Key('mainDivider')));
      expect(divider.height, 10);
      expect(divider.color, kDefaultLightGrey);
      expect(divider.thickness, 1);

      final mainPadding =
          tester.widget<Padding>(find.byKey(const Key('mainPadding')));
      expect(mainPadding.padding.horizontal, 40);
      expect(mainPadding.padding.vertical, 60);

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(ListViewTransactions), findsOneWidget);
    },
  );
}
