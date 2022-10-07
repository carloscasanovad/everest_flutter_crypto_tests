import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_custom_app_bar.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_form_field_widget.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
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
      await loadPage(
          tester,
          ExchangeFormFieldWidget(
            exchangeArguments: FakeData.createExchangeArguments(),
            cryptoList: [],
          ));

      await tester.pumpAndSettle();

      final textHelper =
          tester.widget<Text>(find.byKey(const Key('textHelper')));
      expect(textHelper.data, 'R\$ ${formater.format(moneyToChange)}');
      expect(textHelper.style!.color, kDefaultBlack);
      expect(textHelper.style!.fontSize, 16);
      expect(textHelper.style!.fontWeight, FontWeight.bold);

      expect(find.byType(SizedBox), findsWidgets);
    },
  );
}
