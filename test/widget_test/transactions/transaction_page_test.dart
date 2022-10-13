import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/views/transactions_page.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/widgets/list_view_transactions.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_page.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN TransactionPage is open, THEN find main widgets',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, const TransactionsPage());

      await tester.pumpAndSettle();

      final mainPadding =
          tester.widget<Padding>(find.byKey(const Key('mainPadding')));
      expect(mainPadding.padding.horizontal, 40);
      expect(mainPadding.padding.vertical, 60);

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(ListViewTransactions), findsOneWidget);
      expect(find.byType(BottomNavBar), findsOneWidget);

      await tester.tap(find.text(AppLocalizationsEn().transactions).first);
      await tester.pumpAndSettle();
      expect(find.byType(TransactionsPage), findsOneWidget);
      await tester.tap(find.text(AppLocalizationsEn().portfolio).first);
      await tester.pumpAndSettle();
      expect(find.byType(WalletPage), findsOneWidget);
    });
  });
}
