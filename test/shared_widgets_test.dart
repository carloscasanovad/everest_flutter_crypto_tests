import 'package:everest_flutter_crypto_tests/shared/controllers/asset_provider.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/bottom_nav_bar.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/setup_widget_tester.dart';

class Counter {
  int value = 0;
  void increment() => value++;
  void decrement() => value--;
}

main() {
  group("DefaultAppbar Test", () {
    Future<void> loadPage(WidgetTester tester,
        {required IconData icon,
        required VoidCallback function,
        required String title}) async {
      var defaultAppbar = SetupWidgetTester(
        child: DefaultAppBar(icon: icon, onPressed: function, title: title),
      );
      await tester.pumpWidget(defaultAppbar);
    }

    testWidgets(
        "WHEN DefaultApp receives information, THEN ensure that the information is being used",
        (WidgetTester tester) async {
      final counter = Counter();
      const IconData specificIcon = Icons.abc;
      const String specificTitle = '';

      await loadPage(
        tester,
        function: (() => counter.increment()),
        icon: specificIcon,
        title: specificTitle,
      );

      final defaultAppBar =
          tester.widget<DefaultAppBar>(find.byType(DefaultAppBar));

      expect(defaultAppBar.title, specificTitle);
      expect(defaultAppBar.icon, specificIcon);

      await tester.tap(find.byType(IconButton));
      expect(counter.value, 1);
    });
  });

}