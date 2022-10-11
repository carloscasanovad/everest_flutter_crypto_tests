import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_screen.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/crypto_list_view.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN WalletScreen receives data, THEN ensure that the button of cryptoBeingExchange is receving the specific value passed on arguments',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, const WalletScreen());

        await tester.pumpAndSettle();

        expect(find.byType(Column), findsWidgets);
        expect(find.byKey(const Key('walletSafeArea')), findsOneWidget);
        expect(find.byType(Header), findsOneWidget);
        expect(find.byType(CryptoListView), findsOneWidget);
      });
    },
  );
}
