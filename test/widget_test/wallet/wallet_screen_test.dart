import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/dropdown_buttons.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_body.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/widgets/exchange_form_field_widget.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_screen.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/crypto_list_view.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/header.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_text_styles.dart';
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
