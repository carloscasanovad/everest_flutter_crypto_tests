import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/bottom_sheet_widget.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_text_styles.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester_with_providers.dart';

void main() {
  testWidgets(
    'WHEN bottomSheetWidget is created, THEN validate the main container padding and floatingActionButton',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPageWithProviders(
            tester,
            BottomSheetWidget(
              cryptoBalance: faker.currency.random.decimal(scale: 15, min: 1),
              cryptoToExchangeData: FakeData.createCryptoViewData(),
            ));

        await tester.pumpAndSettle();

        final moneyToExchangeText =
            tester.widget<Text>(find.byKey(const Key('moneyToExchangeText')));
        expect(moneyToExchangeText.data, '1.000000 BTC');
        expect(moneyToExchangeText.style, kDefaultParagraphStyle);

        final bottomSheetContainer = tester
            .widget<Container>(find.byKey(const Key('bottomSheetContainer')));

        expect(bottomSheetContainer.padding!.horizontal, 40);
        expect(bottomSheetContainer.padding!.vertical, 20);

        expect(find.text(AppLocalizationsEn().total), findsOneWidget);

        final floatingActionButton = tester.widget<FloatingActionButton>(
            find.byKey(const Key('floatingButton')));
        final floatingActionButtonChild =
            tester.widget<Icon>(find.byKey(const Key('floatingButtonIcon')));

        expect(floatingActionButton.backgroundColor, kDefaultRed);
        expect(floatingActionButton.isExtended, true);
        expect(floatingActionButtonChild.icon, Icons.arrow_forward_ios);
      });
    },
  );
}
