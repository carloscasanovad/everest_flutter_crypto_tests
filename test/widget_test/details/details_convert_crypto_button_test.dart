import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/convert_crypto_button.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_header.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/views/exchange_page.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets(
    'WHEN ConvertCryptoButton is created, THEN find specific widgets',
    (WidgetTester tester) async {
      final cryptoArguments = FakeData.createCryptoDataArguments();
      mockNetworkImagesFor(() async {
        await loadPage(
            tester, ConvertCryptoButton(cryptoDataArguments: cryptoArguments));

        await tester.pumpAndSettle();

        final converCrypto =
            tester.widget<Text>(find.text(AppLocalizationsEn().convertCrypto));

        expect(
          converCrypto.style,
          const TextStyle(fontSize: 17, color: Color(0xffffffff)),
        );

        final convertSizedBoxButton = tester
            .widget<SizedBox>(find.byKey(const Key('convertSizedBoxButton')));

        expect(convertSizedBoxButton.height, 46);

        final convertButton = tester
            .widget<MaterialButton>(find.byKey(const Key('convertButton')));

        expect(convertButton.color, kDefaultRed);
        expect(convertButton.minWidth, double.infinity);
        expect(
            convertButton.shape,
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: kDefaultRed)));
      });
    },
  );
}
