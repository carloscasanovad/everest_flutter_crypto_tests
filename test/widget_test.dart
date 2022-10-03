import 'package:everest_flutter_crypto_tests/modules/sucess/sucess_page.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/widgets/header.dart';
import 'package:everest_flutter_crypto_tests/shared/controllers/asset_provider.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/setup_widget_tester.dart';

main() {
  group("Wallet Page", () {
    Future<void> loadPage(WidgetTester tester,
        {required IconData icon,
        required VoidCallback function,
        required String title}) async {
      var sucessPage = SetupWidgetTester(
        child: DefaultAppBar(
          icon: icon,
          onPressed: function,
          title: title,
        ),
      );
      await tester.pumpWidget(sucessPage);
    }

    testWidgets("SucessPage Test", (WidgetTester tester) async {
      const IconData specificIcon = Icons.abc;
      const String specificTitle = '';
      await loadPage(
        tester,
        function: () {},
        icon: specificIcon,
        title: specificTitle,
      );
      final defaultAppBar =
          tester.widget<DefaultAppBar>(find.byType(DefaultAppBar));
      expect(defaultAppBar.title, specificTitle);
      expect(defaultAppBar.icon, specificIcon);
    });
  });
}
