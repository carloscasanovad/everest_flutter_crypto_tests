import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/crypto_list_tile.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../helpers/setup_widget_tester.dart';

main() {
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
        final formater = NumberFormat("#,##0.00", "pt");
        CryptoDataViewData crypto = CryptoDataViewData(
            id: faker.guid.guid(),
            symbol: faker.guid.guid(),
            name: faker.guid.guid(),
            image: faker.internet.httpUrl(),
            current_price: faker.currency.random.decimal(scale: 15, min: 1),
            market_cap_change_percentage_24h:
                faker.currency.random.decimal(scale: 15, min: 1));
        double cryptoBalance = faker.currency.random.decimal(scale: 15, min: 1);
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
