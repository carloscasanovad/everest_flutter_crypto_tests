import 'package:everest_flutter_crypto_tests/modules/details/widgets/crypto_infomation_row.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/crypto_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN CryptoInformation receives data, THEN ensure that some specific widgets exists',
    (WidgetTester tester) async {
      await loadPage(
          tester,
          CryptoInformation(
            cryptoDataArguments: FakeData.createCryptoDataArguments(),
            marketChartData: FakeData.createMarketChartViewData(),
          ));

      await tester.pumpAndSettle();

      final cryptoInformationPadding = tester
          .widget<Padding>(find.byKey(const Key('cryptoInformationPadding')));
      expect(cryptoInformationPadding.padding.vertical, 38);

      expect(find.byType(CryptoInformationRow), findsWidgets);
      expect(find.byType(Column), findsWidgets);
    },
  );
}
