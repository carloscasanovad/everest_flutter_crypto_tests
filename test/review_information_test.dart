import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_data.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  testWidgets(
    'WHEN ReviewInformation is created, THEN ensure that main widgets exists',
    (WidgetTester tester) async {
      await loadPage(tester,
          ReviewInformation(reviewArguments: FakeData.createReviewArguments()));
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
