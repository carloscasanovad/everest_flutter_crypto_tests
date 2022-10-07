import 'package:everest_flutter_crypto_tests/modules/details/views/details_page.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_body.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_data.dart';
import 'helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN detailsPage is created, THEN find main widgets',
    (WidgetTester tester) async {
      await loadPage(
          tester,
          DetailsPage(
              cryptoDataArguments: FakeData.createCryptoDataArguments()));

      await tester.pumpAndSettle();

      expect(find.byType(DefaultAppBar), findsOneWidget);
      expect(find.byType(DetailsBody), findsOneWidget);
    },
  );
}
