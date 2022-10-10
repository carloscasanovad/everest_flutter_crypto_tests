import 'package:everest_flutter_crypto_tests/l10n/app_localizations.dart';
import 'package:everest_flutter_crypto_tests/modules/details/controllers/providers.dart';
import 'package:everest_flutter_crypto_tests/modules/details/model/market_chart_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/details/repositories/market_chart_repository_provider.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/controllers/provider.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/controllers/providers.dart';
import 'package:everest_flutter_crypto_tests/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'fake_data.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWidgetTester({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getFakeCryptoData = Provider((ref) {
      return FakeCryptoDataRepository();
    });
    final ableToExchangeProviderTest = StateProvider<bool>(
      (ref) => true,
    );
    return ProviderScope(
      overrides: [
        getCryptosDataProvider.overrideWithProvider(getFakeCryptoData),
        ableToExchangeProvider.overrideWithProvider(ableToExchangeProviderTest)
      ],
      child: MaterialApp(
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

Future<void> loadPage(WidgetTester tester, Widget child) async {
  var widget = SetupWidgetTester(child: child);
  await tester.pumpWidget(widget);
}
