import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN detailsHeader is created, THEN find specific widgets',
    (WidgetTester tester) async {
      final cryptoArguments = FakeData.createCryptoDataArguments();
      mockNetworkImagesFor(() async {
        await loadPage(
            tester, DetailsHeader(cryptoDataArguments: cryptoArguments));

        await tester.pumpAndSettle();

        expect(find.text(cryptoArguments.crypto.name), findsOneWidget);
        expect(find.text(cryptoArguments.crypto.symbol.toUpperCase()),
            findsOneWidget);

        final cryptoAvatar =
            tester.widget<CircleAvatar>(find.byKey(const Key('cryptoAvatar')));

        expect(cryptoAvatar.backgroundImage,
            NetworkImage(cryptoArguments.crypto.image));
        expect(cryptoAvatar.backgroundColor, const Color(0x00ffffff));
        expect(cryptoAvatar.radius, 30);
      });
    },
  );
}
