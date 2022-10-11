import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/details/views/details_page.dart';
import 'package:everest_flutter_crypto_tests/modules/details/views/details_screen.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN detailsPage is created, THEN find main widgets',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            DetailsPage(
                cryptoDataArguments: FakeData.createCryptoDataArguments()));

        await tester.pumpAndSettle();

        expect(find.byType(Scaffold), findsOneWidget);
        final detailsAppBar =
            tester.widget<DefaultAppBar>(find.byType(DefaultAppBar));
        expect(detailsAppBar.icon, Icons.arrow_back_ios_new_outlined);
        expect(detailsAppBar.title, AppLocalizationsEn().details);
      });
    },
  );
}
