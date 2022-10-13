import 'package:everest_flutter_crypto_tests/modules/exchange/views/exchange_page.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/bottom_sheet_widget.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_body.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_custom_app_bar.dart';
import 'package:everest_flutter_crypto_tests/modules/review/views/review_page.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester_with_providers.dart';

void main() {
  testWidgets(
    'WHEN ExchangePage is built, THEN ensure that appBar, body and bottomSheet exists',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPageWithProviders(
            tester,
            ExchangePage(
                exchangeArguments: FakeData.createExchangeArguments()));
        await tester.pumpAndSettle();
        expect(find.byType(ExchangeCustomAppBar), findsOneWidget);
        expect(find.byType(ExchangeBody), findsOneWidget);
        expect(find.byType(BottomSheetWidget), findsOneWidget);

        final floatingButton = tester.widget<FloatingActionButton>(
            find.byKey(const Key('floatingButton')));

        expect(floatingButton.backgroundColor, kDefaultRed);

        await tester.enterText(find.byType(TextFormField), '2');

        await tester.tap(find.byType(FloatingActionButton));

        await tester.pumpAndSettle();

        expect(find.byType(ReviewPage), findsOneWidget);
      });
    },
  );
}
