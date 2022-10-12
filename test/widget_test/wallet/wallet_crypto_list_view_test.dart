import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/crypto_list_view.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/setup_widget_tester.dart';
import '../../helpers/setup_widget_tester_with_providers.dart';

void main() {
  group("CryptoListView Test", () {
    testWidgets(
        "WHEN CryptoListView is created, THEN ensure that given data is being used on the widget",
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            CryptoListView(
              userCryptoWallet: [],
            ));

        await tester.pumpAndSettle();

        await tester.tap(find.byType(DefaultErrorWidget));
      });
    });
  });
}
