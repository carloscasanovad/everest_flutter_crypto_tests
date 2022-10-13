import 'package:everest_flutter_crypto_tests/shared/widgets/bottom_nav_bar.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:faker/faker.dart';
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
    testWidgets(
        "WHEN DefaultAppBar receives information, THEN ensure that the information is being used",
        (WidgetTester tester) async {
      final counter = Counter();
      IconData specificIcon = Icons.abc;
      String specificTitle = faker.guid.guid();

      await loadPage(
          tester,
          DefaultAppBar(
            onPressed: (() => counter.increment()),
            icon: specificIcon,
            title: specificTitle,
          ));

      final defaultAppBar =
          tester.widget<DefaultAppBar>(find.byType(DefaultAppBar));

      expect(defaultAppBar.title, specificTitle);
      expect(defaultAppBar.icon, specificIcon);

      await tester.tap(find.byType(IconButton));
      expect(counter.value, 1);
    });
  });

  group("BottomNavbar Test", () {
    testWidgets("WHEN using BottomNavBar, THEN ensure that some widgets exists",
        (WidgetTester tester) async {
      await loadPage(tester, const BottomNavBar());

      expect(find.byKey(const Key('bottomNavBar')), findsOneWidget);
      expect(find.byKey(const Key('warrenIcon')), findsOneWidget);
      expect(find.byKey(const Key('cryptoCurrencyIcon')), findsOneWidget);
    });
  });
}
