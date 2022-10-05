import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/views/exchange_page.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/bottom_sheet_widget.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_body.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_custom_app_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/fake_crypto_data_view_data.dart';
import '../../../helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(WidgetTester tester,
      {required ExchangeArguments exchangeArguments}) async {
    var exchangePage = SetupWidgetTester(
      child: ExchangePage(exchangeArguments: exchangeArguments),
    );
    await tester.pumpWidget(exchangePage);
  }

  testWidgets(
    'WHEN ExchangePage is built, THEN ensure that appBar, body and bottomSheet exists',
    (WidgetTester tester) async {
      FakeCryptoDataRepository fakeData = FakeCryptoDataRepository();
      ExchangeArguments exchangeArguments = ExchangeArguments(
          crypto: fakeData.getData(),
          cryptoBalance: faker.currency.random.decimal(scale: 15, min: 1),
          cryptoValue: faker.currency.random.decimal(scale: 15, min: 1));

      await loadPage(tester, exchangeArguments: exchangeArguments);
      await tester.pumpAndSettle();
      expect(find.byType(ExchangeCustomAppBar), findsOneWidget);
      expect(find.byType(ExchangeBody), findsOneWidget);
      expect(find.byType(BottomSheetWidget), findsOneWidget);
    },
  );
}
