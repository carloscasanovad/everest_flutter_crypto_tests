import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/crypto_list_tile.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/crypto_list_view.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/header.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:network_image_mock/network_image_mock.dart';

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
        UserWalletModel(id: '', userCryptoBalance: 10),
        UserWalletModel(id: '', userCryptoBalance: 20),
        UserWalletModel(id: '', userCryptoBalance: 30),
        UserWalletModel(id: '', userCryptoBalance: 40),
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

  group("WalletPage/Body Test", () {
    Future<void> loadPage(WidgetTester tester,
        {required CryptoDataViewData crypto,
        required double cryptoBalance}) async {
      var walletPageBody = SetupWidgetTester(
        child: CryptoListTile(
          crypto: crypto,
          cryptoBalance: cryptoBalance,
        ),
      );
      await tester.pumpWidget(walletPageBody);
    }

    testWidgets(
        "WHEN CryptoListTile is created, THEN ensure that given data is being used on the widget",
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        CryptoDataViewData crypto = CryptoDataViewData(
            id: 'btc',
            symbol: 'btc',
            name: 'bitcoin',
            image:
                'https://img2.gratispng.com/20180604/zya/kisspng-bitcoin-com-cryptocurrency-logo-zazzle-kibuba-btc-5b15aa1f157d09.468430171528146463088.jpg',
            current_price: 1000,
            market_cap_change_percentage_24h: 10);
        final formater = NumberFormat("#,##0.00", "pt");
        double cryptoBalance = 100;
        double cryptoBalanceExchanged = cryptoBalance / crypto.current_price;

        await loadPage(tester, crypto: crypto, cryptoBalance: cryptoBalance);

        await tester.pumpAndSettle();

        final listTileTitle =
            tester.widget<Text>(find.byKey(const Key('listTileTitle')));
        final listTileSubtitle =
            tester.widget<Text>(find.byKey(const Key('listTileSubtitle')));
        final listTileLeading = tester
            .widget<CircleAvatar>(find.byKey(const Key('listTileLeading')));
        final userCryptoBalance =
            tester.widget<Text>(find.byKey(const Key('userCryptoBalance')));
        final userCryptoBalanceExchanged = tester
            .widget<Text>(find.byKey(const Key('userCryptoBalanceExchanged')));

        expect(listTileTitle.data, crypto.name);
        expect(listTileSubtitle.data, crypto.symbol.toUpperCase());
        expect(listTileLeading.backgroundImage, NetworkImage(crypto.image));
        expect(userCryptoBalance.data, 'R\$ ${formater.format(cryptoBalance)}');
        expect(userCryptoBalanceExchanged.data,
            '${cryptoBalanceExchanged.toStringAsFixed(2)} ${crypto.symbol.toUpperCase()}');
      });
    });
  });
}
