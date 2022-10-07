import 'package:everest_flutter_crypto_tests/modules/details/views/details_screen.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/convert_crypto_button.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_body.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN detailsScreen is created, THEN find main widgets',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            DetailsScreen(
                cryptoDataArguments: FakeData.createCryptoDataArguments()));

        await tester.pumpAndSettle();

        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.byType(DetailsHeader), findsOneWidget);
        expect(find.byType(DetailsBody), findsOneWidget);
        expect(find.byType(ConvertCryptoButton), findsOneWidget);
      });
    },
  );
}
