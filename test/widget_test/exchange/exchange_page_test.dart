import 'package:everest_flutter_crypto_tests/modules/exchange/views/exchange_page.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/bottom_sheet_widget.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_body.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_custom_app_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN ExchangePage is built, THEN ensure that appBar, body and bottomSheet exists',
    (WidgetTester tester) async {
      await loadPage(tester,
          ExchangePage(exchangeArguments: FakeData.createExchangeArguments()));
      await tester.pumpAndSettle();
      expect(find.byType(ExchangeCustomAppBar), findsOneWidget);
      expect(find.byType(ExchangeBody), findsOneWidget);
      expect(find.byType(BottomSheetWidget), findsOneWidget);
    },
  );
}
