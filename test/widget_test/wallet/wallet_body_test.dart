import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/crypto_list_tile.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  group("WalletPage/Body Test", () {
    testWidgets(
        "WHEN CryptoListTile is created, THEN ensure that given data is being used on the widget",
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        final formater = NumberFormat("#,##0.00", "pt");
        CryptoDataViewData crypto = FakeData.createCryptoViewData();
        double cryptoBalance = faker.currency.random.decimal(scale: 15, min: 1);
        double cryptoBalanceExchanged = cryptoBalance / crypto.current_price;

        await loadPage(tester,
            CryptoListTile(crypto: crypto, cryptoBalance: cryptoBalance));

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
