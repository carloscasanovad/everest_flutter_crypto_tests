import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/sucess/sucess_page.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    "WHEN SucessPage is showed, THEN find a Hero widget with image and a success description",
    (WidgetTester tester) async {
      await loadPage(tester, const SuccessPage());

      final heroWidget = tester.widget<Hero>(find.byType(Hero));
      expect(heroWidget.tag, 'check');

      final sucessAppBar =
          tester.widget<DefaultAppBar>(find.byKey(const Key('sucessAppBar')));
      expect(sucessAppBar.icon, Icons.close);
      expect(sucessAppBar.title, '');

      final successPageContainer =
          tester.widget<Container>(find.byType(Container));
      expect(successPageContainer.padding!.horizontal, 20);
      expect(successPageContainer.padding!.vertical, 30);

      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(Center), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byKey(const Key('successImage')), findsOneWidget);
      expect(find.text(AppLocalizationsEn().successTitle), findsOneWidget);
      expect(find.text(AppLocalizationsEn().successSubtitle), findsOneWidget);
    },
  );
}
