import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/setup_widget_tester.dart';

main() {
  group("Wallet Page", () {
    Future<void> loadPage(WidgetTester tester) async {
      var walletPageHeader = SetupWidgetTester(
        child: Header(
          userCryptoWallet: [
            UserWalletModel(id: 'btc', userCryptoBalance: 100)
          ],
        ),
      );
      await tester.pumpWidget(walletPageHeader);
    }

    testWidgets("WalletPage Test", (WidgetTester tester) async {
      await loadPage(tester);
      final findIconButton = find.byType(IconButton);
      expect(findIconButton, findsOneWidget);
      final padding = tester.widget<Padding>(
        find.byType(Padding),
      );
      expect(padding.padding, const EdgeInsets.all(20));
    });
  });
}
