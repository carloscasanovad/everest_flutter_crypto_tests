import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/header.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'helpers/fake_crypto_data_view_data.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  group("WalletPage/Header Test", () {
    Future<void> loadPage(WidgetTester tester,
        {required List<UserWalletModel> userCryptoWallet}) async {
      var walletPageHeader = SetupWidgetTester(
        child: Header(userCryptoWallet: userCryptoWallet),
      );
      await tester.pumpWidget(walletPageHeader);
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
        "WHEN header loaded, THEN calculate and show userBalance based on the fakeUserCryptoWallet argument",
        (WidgetTester tester) async {
      final formater = NumberFormat("#,##0.00", "pt");
      double balance = 0;

      List<UserWalletModel> fakeUserCryptoWallet = [
        UserWalletModel(
            id: faker.guid.guid(),
            userCryptoBalance:
                faker.currency.random.decimal(scale: 15, min: 1)),
        UserWalletModel(
            id: faker.guid.guid(),
            userCryptoBalance:
                faker.currency.random.decimal(scale: 15, min: 1)),
      ];

      await loadPage(tester, userCryptoWallet: fakeUserCryptoWallet);

      String calculateFakeCryptoBalance() {
        for (var crypto in fakeUserCryptoWallet) {
          balance += crypto.userCryptoBalance;
        }
        return formater.format(balance);
      }

      final userBalance =
          tester.widget<Text>(find.byKey(const Key('userBalance')));

      expect(userBalance.data, calculateFakeCryptoBalance());
    });
  });
}
