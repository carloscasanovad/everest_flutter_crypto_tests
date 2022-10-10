import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information_button.dart';
import 'package:everest_flutter_crypto_tests/modules/sucess/sucess_page.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN ReviewInformationButton is created, THEN build AnimatedContainer with Curves, 0.5sec duration and a initButton Widget',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ReviewInformationButton(
          cryptoBeingExchangedInfo: faker.guid.guid(),
          cryptoToExchangedInfo: faker.guid.guid(),
          exchangeEqualsTo: faker.guid.guid(),
          moneyBeingExchangedInfo: faker.guid.guid(),
        ),
      );
      await tester.pumpAndSettle();

      final animatedContainer =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));

      expect(animatedContainer.duration.inMilliseconds, 500);
      expect(animatedContainer.curve, Curves.easeIn);

      final convertText =
          tester.widget<Text>(find.text(AppLocalizationsEn().convert));
      expect(convertText.data, AppLocalizationsEn().convert);
      expect(convertText.style!.fontSize, 17);
      expect(convertText.style!.color, const Color(0xffffffff));

      expect(find.byKey(const Key('initContainer')), findsOneWidget);
      final initContainer =
          tester.widget<Container>(find.byKey(const Key('initContainer')));
      expect(initContainer.margin!.vertical, 10);

      final initContainerButton = tester
          .widget<MaterialButton>(find.byKey(const Key('initContainerButton')));
      expect(initContainerButton.color, kDefaultRed);
      expect(
          initContainerButton.shape,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: kDefaultRed)));

      expect(find.byKey(const Key('loadingButton')), findsNothing);
      expect(find.byType(Hero), findsNothing);

      await tester.tap(find.byType(MaterialButton));
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      expect(find.byType(SuccessPage), findsOneWidget);
    },
  );
}
