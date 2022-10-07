import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_custom_app_bar.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN ExchangeCustomAppBar is created, THEN validate if some widgets exists',
    (WidgetTester tester) async {
      await loadPage(
          tester,
          ExchangeCustomAppBar(
              exchangeArguments: FakeData.createExchangeArguments()));

      await tester.pumpAndSettle();

      final exchangeAppBar =
          tester.widget<AppBar>(find.byKey(const Key('customAppBar')));

      expect(exchangeAppBar.elevation, 3);
      expect(exchangeAppBar.backgroundColor, kDefaultBackgroundColor);
      expect(find.text(AppLocalizationsEn().convert), findsOneWidget);

      final appBarIcon =
          tester.widget<Icon>(find.byKey(const Key('appBarIcon')));

      expect(appBarIcon.color, kDefaultBlack);
      expect(appBarIcon.icon, Icons.arrow_back_ios);
    },
  );
}
