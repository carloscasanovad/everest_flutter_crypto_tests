import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/body_review_page.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/fake_data.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  testWidgets(
    'WHEN ReviewBody is built, THEN ensure that title and information exists',
    (WidgetTester tester) async {
      FakeData fakeData = FakeData();
      await loadPage(tester,
          BodyReviewPage(reviewArguments: fakeData.createReviewArguments()));
      await tester.pumpAndSettle();

      final mainPadding = tester.widget<Padding>(find.byType(Padding).first);
      expect(mainPadding.padding.horizontal, 40);
      expect(mainPadding.padding.vertical, 40);

      expect(find.text(AppLocalizationsEn().confirmTitle), findsOneWidget);
      expect(find.byType(ReviewInformation), findsOneWidget);
    },
  );
}
