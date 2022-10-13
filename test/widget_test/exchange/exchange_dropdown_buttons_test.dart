import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/dropdown_buttons.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN DropDownButtons receives data, THEN ensure that the button of cryptoBeingExchange is receving the specific value passed on arguments',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        ExchangeArguments exchangeArguments =
            FakeData.createExchangeArguments();
        String selectedCrypto = '';
        List<CryptoDataViewData> cryptoList = [];
        String cryptoSymbol = exchangeArguments.crypto.symbol.toUpperCase();

        await loadPage(
            tester,
            DropDownButtons(
                exchangeArguments: exchangeArguments,
                cryptoList: cryptoList,
                selectedCrypto: selectedCrypto));
        await tester.pumpAndSettle();

        final cryptoBeingExchangeButton = tester.widget<DropdownButton>(
            find.byKey(const Key("cryptoBeingExchangeDropdown")));
        expect(cryptoBeingExchangeButton.value, cryptoSymbol);
        expect(cryptoBeingExchangeButton.items!.isNotEmpty, true);
        expect(cryptoBeingExchangeButton.onChanged, null);

        final criptoLogo =
            tester.widget<Image>(find.byKey(const Key("criptoLogo")));
        expect(criptoLogo.height, 24);

        final lastSizedBox =
            tester.widget<SizedBox>(find.byType(SizedBox).last);
        expect(lastSizedBox.height, 5);

        expect(find.byType(SizedBox), findsWidgets);
        expect(find.byType(Row), findsWidgets);

        final exchangeSwapIcon =
            tester.widget<Icon>(find.byKey(const Key("exchangeSwapIcon")));
        expect(exchangeSwapIcon.icon, Icons.swap_horiz);
        expect(exchangeSwapIcon.color, kDefaultRed);
        expect(exchangeSwapIcon.size, 30);

        expect(find.text(cryptoSymbol), findsOneWidget);

        final cryptoToExchangeDropdown = tester.widget<DropdownButton>(
            find.byKey(const Key("cryptoToExchangeDropdown")));
        expect(cryptoToExchangeDropdown.menuMaxHeight, 300);
        expect(cryptoToExchangeDropdown.onChanged.toString().isNotEmpty, true);
        await tester.tap(find.byKey(const Key("cryptoToExchangeDropdown")));

        await tester.pumpAndSettle();
      });
    },
  );
}
