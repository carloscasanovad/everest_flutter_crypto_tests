import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/review/model/review_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/body_review_page.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/fake_crypto_data_view_data.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(WidgetTester tester,
      {required ReviewArguments reviewArguments}) async {
    var reviewBody = SetupWidgetTester(
      child: BodyReviewPage(
        reviewArguments: reviewArguments,
      ),
    );
    await tester.pumpWidget(reviewBody);
  }

  testWidgets(
    'WHEN ReviewBody is built, THEN ensure that title and information exists',
    (WidgetTester tester) async {
      FakeCryptoDataRepository fakeData = FakeCryptoDataRepository();
      await loadPage(tester,
          reviewArguments: ReviewArguments(
            cryptoToExchangeValue:
                faker.currency.random.decimal(scale: 15, min: 1),
            cryptoToExchangeData: fakeData.getData(),
            cryptoBeingExchangedValue:
                faker.currency.random.decimal(scale: 15, min: 1),
            cryptoBeingExchangeData: fakeData.getData(),
          ));
      await tester.pumpAndSettle();

      final mainPadding = tester.widget<Padding>(find.byType(Padding).first);
      expect(mainPadding.padding.horizontal, 40);
      expect(mainPadding.padding.vertical, 40);

      expect(find.text(AppLocalizationsEn().confirmTitle), findsOneWidget);
      expect(find.byType(ReviewInformation), findsOneWidget);
    },
  );
}
