import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_page.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_screen.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
      "WHEN WalletPage is created, THEN ensure that main widgets exists",
      (WidgetTester tester) async {
    await loadPage(tester, const WalletPage());

    await tester.pumpAndSettle();

    expect(find.byType(WalletScreen), findsOneWidget);
    expect(find.byType(BottomNavBar), findsOneWidget);
  });
}
