import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import 'helpers/setup_widget_tester.dart';

main() {
  group("WalletPage/Header Test", () {
    Future<void> loadPage(WidgetTester tester,
        {required List<UserWalletModel> userCryptoWallet}) async {
      var defaultAppbar = SetupWidgetTester(
        child: Header(userCryptoWallet: userCryptoWallet),
      );
      await tester.pumpWidget(defaultAppbar);
    }

    testWidgets(
        'WHEN the IconButton of WalletPage is clicked, THEN change visibility icon',
        (WidgetTester tester) async {
      await loadPage(tester, userCryptoWallet: []);

      expect(find.byIcon(Icons.visibility_rounded), findsOneWidget);
      await tester.tap(find.byKey(const Key('changeVisibility')));
      // Pump ativa um frame depois de uma ação, geralmente usado
      // para esperar a mudança de estado do widget
      await tester.pump();
      expect(find.byIcon(Icons.visibility_off_rounded), findsOneWidget);
      expect(find.byIcon(Icons.visibility_rounded), findsNothing);
    });
    
    testWidgets(
        "WHEN header loaded, THEN calculate and show userBalance based on the userCryptoWallet argument",
        (WidgetTester tester) async {
      await loadPage(tester, userCryptoWallet: [
        UserWalletModel(id: '', userCryptoBalance: 10),
        UserWalletModel(id: '', userCryptoBalance: 20),
        UserWalletModel(id: '', userCryptoBalance: 30),
        UserWalletModel(id: '', userCryptoBalance: 40),
      ]);

      final formater = NumberFormat("#,##0.00", "pt");
      final balance = formater.format(100);

      final userBalance =
          tester.widget<Text>(find.byKey(const Key('userBalance')));

      expect(userBalance.data, balance);
    });
  });

  // group(description, body)
}
