import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information_button.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(WidgetTester tester) async {
    var reviewInformationButton = SetupWidgetTester(
      child: ReviewInformationButton(
        cryptoBeingExchangedInfo: faker.guid.guid(),
        cryptoToExchangedInfo: faker.guid.guid(),
        exchangeEqualsTo: faker.guid.guid(),
        moneyBeingExchangedInfo: faker.guid.guid(),
      ),
    );
    await tester.pumpWidget(reviewInformationButton);
  }

  testWidgets(
    'WHEN ReviewInformationButton is created, THEN build AnimatedContainer with Curves, 0.5sec duration and a initButton Widget',
    (WidgetTester tester) async {
      await loadPage(tester);
      await tester.pumpAndSettle();

      final animatedContainer =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));

      expect(animatedContainer.duration.inMilliseconds, 500);
      expect(animatedContainer.curve, Curves.easeIn);
      expect(find.byKey(const Key('initButton')), findsOneWidget);
      expect(find.byKey(const Key('loadingButton')), findsNothing);
    },
  );
}
