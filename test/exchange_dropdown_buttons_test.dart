import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/dropdown_buttons.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'helpers/fake_data.dart';
import 'helpers/setup_widget_tester.dart';

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
      });
    },
  );
}
