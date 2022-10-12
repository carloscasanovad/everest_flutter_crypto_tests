import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_form_field_widget.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN ExchangeFormFieldWidget is created, THEN validate if some widgets exists',
    (WidgetTester tester) async {
      final formater = NumberFormat("#,##0.00", "pt");
      double moneyToChange = 0;
      ExchangeArguments args = ExchangeArguments(
          crypto: CryptoDataViewData(
              id: '',
              symbol: '',
              name: '',
              image: '',
              current_price: 2,
              market_cap_change_percentage_24h: 2),
          cryptoBalance: 3,
          cryptoValue: 3);
      await loadPage(
          tester,
          ExchangeFormFieldWidget(
            exchangeArguments: args,
            cryptoList: [FakeData.createCryptoViewData()],
          ));
      String cryptoSymbol = args.crypto.symbol.toUpperCase();
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsOneWidget);

      TextField textField =
          find.byType(TextField).evaluate().first.widget as TextField;
      expect(textField.inputFormatters!.isNotEmpty, true);
      expect(textField.keyboardType, TextInputType.number);
      expect(textField.style!.fontSize, 28);
      expect(textField.decoration!.isDense, true);
      expect(textField.onChanged, isNotNull);
      expect(
          textField.decoration!.prefixIconConstraints!.hasBoundedHeight, false);
      expect(
          textField.decoration!.prefixIconConstraints!.hasBoundedWidth, false);
      expect(textField.decoration!.hintText, '0,00');
      expect(textField.decoration!.hintStyle, kHintInputFormTextStyle);

      expect(find.text('$cryptoSymbol '), findsOneWidget);

      final textHelper =
          tester.widget<Text>(find.byKey(const Key('textHelper')));
      expect(textHelper.data, 'R\$ ${formater.format(moneyToChange)}');
      expect(textHelper.style!.color, kDefaultBlack);
      expect(textHelper.style!.fontSize, 16);
      expect(textHelper.style!.fontWeight, FontWeight.bold);

      expect(find.byType(SizedBox), findsWidgets);

      await tester.tap(find.byType(TextFormField));
    },
  );
}
