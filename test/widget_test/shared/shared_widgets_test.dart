import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/bottom_nav_bar.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_appbar.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_error_widget.dart';
import 'package:everest_flutter_crypto_tests/shared/widgets/default_loading_spinner.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/setup_widget_tester.dart';

class Counter {
  int value = 0;
  void increment() => value++;
  void decrement() => value--;
}

void main() {
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
      await loadPage(tester, BottomNavBar(index: 0));

      final bottomNavBar = tester
          .widget<BottomNavigationBar>(find.byKey(const Key('bottomNavBar')));
      expect(bottomNavBar.selectedItemColor, kDefaultRed);
      expect(find.byKey(const Key('warrenIcon')), findsOneWidget);
      expect(find.byKey(const Key('cryptoCurrencyIcon')), findsOneWidget);
    });
  });
  group("DefaultLoadingSpinner Test", () {
    testWidgets(
        "WHEN using DefaultLoadingSpinner, THEN ensure that some widgets exists",
        (WidgetTester tester) async {
      await loadPage(tester, const DefaultLoadingSpinner());

      final loadingSpinner = tester
          .widget<SpinKitFadingCube>(find.byKey(const Key('loadingSpinner')));
      expect(loadingSpinner.color, kDefaultRed);
      expect(loadingSpinner.size, 50);

      expect(find.byKey(const Key("centerSpinner")), findsOneWidget);
    });
  });
  group("DefaultErrorWidget Test", () {
    testWidgets(
        "WHEN using DefaultErrorWidget, THEN ensure that some widgets exists",
        (WidgetTester tester) async {
      await loadPage(tester, const DefaultErrorWidget());

      expect(find.byType(Center), findsOneWidget);
      expect(find.byKey(const Key('lottie')), findsOneWidget);
    });
  });
}
