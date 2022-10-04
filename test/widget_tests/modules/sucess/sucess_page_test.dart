import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/sucess/sucess_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(
    WidgetTester tester,
  ) async {
    const successPage = SetupWidgetTester(
      child: SuccessPage(),
    );
    await tester.pumpWidget(successPage);
  }

  testWidgets(
    "WHEN SucessPage is showed, THEN find a Hero widget with image and a success description",
    (WidgetTester tester) async {
      await loadPage(tester);

      final heroWidget = tester.widget<Hero>(find.byType(Hero));

      expect(heroWidget.tag, 'check');
      expect(find.byKey(const Key('successImage')), findsOneWidget);
      expect(find.text(AppLocalizationsEn().successTitle), findsOneWidget);
      expect(find.text(AppLocalizationsEn().successSubtitle), findsOneWidget);
    },
  );
}