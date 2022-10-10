import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/views/transactions_page.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_page.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_screen.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
      "WHEN WalletPage is created, THEN ensure that main widgets exists",
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, const WalletPage());

      await tester.pumpAndSettle();

      expect(find.byType(WalletScreen), findsOneWidget);
      expect(find.byType(BottomNavBar), findsOneWidget);

      await tester.tap(find.text(AppLocalizationsEn().transactions).first);
      await tester.pumpAndSettle();
      expect(find.byType(TransactionsPage), findsOneWidget);
    });
  });
}
