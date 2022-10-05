import 'package:everest_flutter_crypto_tests/modules/details/model/crypto_data_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/details/views/details_page.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_body.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_crypto_data_view_data.dart';
import 'helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(WidgetTester tester,
      {required CryptoDataArguments cryptoDataArguments}) async {
    var detailsPage = SetupWidgetTester(
      child: DetailsPage(
        cryptoDataArguments: cryptoDataArguments,
      ),
    );
    await tester.pumpWidget(detailsPage);
  }

  testWidgets(
    'WHEN detailsPage is created, THEN find main widgets',
    (WidgetTester tester) async {
      FakeCryptoDataRepository fakeData = FakeCryptoDataRepository();
      await loadPage(tester,
          cryptoDataArguments: CryptoDataArguments(
              crypto: fakeData.getData(),
              cryptoBalance: faker.currency.random.decimal(scale: 15, min: 1),
              cryptoValue: faker.currency.random.decimal(scale: 15, min: 1)));

      await tester.pumpAndSettle();

      expect(find.byType(DefaultAppBar), findsOneWidget);
      expect(find.byType(DetailsBody), findsOneWidget);
    },
  );
}
