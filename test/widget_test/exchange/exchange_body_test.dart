import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/dropdown_buttons.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_body.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_form_field_widget.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_text_styles.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN  ExchangeBody receives data, THEN ensure that the button of cryptoBeingExchange is receving the specific value passed on arguments',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        ExchangeArguments exchangeArguments =
            FakeData.createExchangeArguments();
        await loadPage(
            tester, ExchangeBody(exchangeArguments: exchangeArguments));

        expect(find.byType(DefaultLoadingSpinner), findsOneWidget);

        await tester.pumpAndSettle();

        expect(find.byType(DefaultLoadingSpinner), findsNothing);

        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(SizedBox), findsWidgets);
        expect(find.byType(DropDownButtons), findsWidgets);
        expect(find.byType(ExchangeFormFieldWidget), findsWidgets);

        final exchangeTitle =
            tester.widget<Text>(find.byKey(const Key('exchangeTitle')));
        expect(exchangeTitle.data, AppLocalizationsEn().exchangeTitle);
        expect(exchangeTitle.style, kTitle2TextStyle);

        final mainPadding =
            tester.widget<Padding>(find.byKey(const Key('mainPadding')));
        expect(mainPadding.padding.vertical, 40);
        expect(mainPadding.padding.horizontal, 40);
      });
    },
  );
}
