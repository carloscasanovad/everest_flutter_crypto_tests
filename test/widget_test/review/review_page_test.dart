import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/details/views/details_page.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/views/exchange_page.dart';
import 'package:everest_flutter_crypto_tests/modules/review/views/review_page.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/body_review_page.dart';
import 'package:everest_flutter_crypto_tests/modules/sucess/sucess_page.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN ReviewPage is built, THEN ensure that reviewAppBar has an specific Icon & main widgets exists',
    (WidgetTester tester) async {
      await loadPage(tester,
          ReviewPage(reviewArguments: FakeData.createReviewArguments()));
      await tester.pumpAndSettle();

      final reviewAppBar =
          tester.widget<DefaultAppBar>(find.byKey(const Key('reviewAppBar')));
      expect(reviewAppBar.icon, Icons.arrow_back_ios_new_outlined);

      expect(find.text(AppLocalizationsEn().confirm), findsOneWidget);
      expect(find.byType(DefaultAppBar), findsOneWidget);
      expect(find.byType(BodyReviewPage), findsOneWidget);
    },
  );
}
