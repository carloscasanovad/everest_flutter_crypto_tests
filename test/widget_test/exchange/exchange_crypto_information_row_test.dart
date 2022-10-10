import 'package:everest_flutter_crypto_tests/modules/details/widgets/crypto_infomation_row.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_text_styles.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN CryptoInformationRow receives data, THEN ensure that some specific widgets exists',
    (WidgetTester tester) async {
      String description = faker.guid.guid();
      String value = faker.guid.guid();
      await loadPage(
          tester, CryptoInformationRow(description: description, value: value));

      await tester.pumpAndSettle();

      final informationDivider =
          tester.widget<Divider>(find.byKey(const Key('informationDivider')));
      expect(informationDivider.thickness, 1);
      expect(informationDivider.height, 30);

      final descriptionText = tester.widget<Text>(find.text(description));
      expect(descriptionText.style, kDetailsCryptoInfoDescriptionStyle);

      final valueText = tester.widget<Text>(find.text(value));
      expect(valueText.style, kDetailsCryptoInfoValueStyle);

      expect(find.byType(Column), findsWidgets);
    },
  );
}
