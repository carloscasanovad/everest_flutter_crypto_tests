import 'package:everest_flutter_crypto_tests/modules/review/model/review_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information_button.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_crypto_data_view_data.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(WidgetTester tester,
      {required ReviewArguments reviewArguments}) async {
    var reviewInformation = SetupWidgetTester(
      child: ReviewInformation(
        reviewArguments: reviewArguments,
      ),
    );
    await tester.pumpWidget(reviewInformation);
  }

  testWidgets(
    'WHEN ReviewInformation is created, THEN ensure that main widgets exists',
    (WidgetTester tester) async {
      FakeCryptoDataRepository fakeData = FakeCryptoDataRepository();
      ReviewArguments reviewArguments = ReviewArguments(
        cryptoToExchangeValue: faker.currency.random.decimal(scale: 15, min: 1),
        cryptoToExchangeData: fakeData.getData(),
        cryptoBeingExchangedValue:
            faker.currency.random.decimal(scale: 15, min: 1),
        cryptoBeingExchangeData: fakeData.getData(),
      );
      await loadPage(tester, reviewArguments: reviewArguments);
      final listViewDivider =
          tester.widget<Divider>(find.byKey(const Key('divider')).first);
      expect(listViewDivider.thickness, 1);
      expect(listViewDivider.height, 1);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byKey(const Key('informationKey')), findsNWidgets(3));
      expect(find.byKey(const Key('informationValue')), findsNWidgets(3));
      expect(find.byType(ReviewInformationButton), findsOneWidget);
    },
  );
}
