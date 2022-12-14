import 'package:everest_flutter_crypto_tests/l10n/app_localizations.dart';
import 'package:everest_flutter_crypto_tests/modules/details/controllers/providers.dart';
import 'package:everest_flutter_crypto_tests/modules/details/model/market_chart_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/details/repositories/market_chart_repository_provider.dart';
import 'package:everest_flutter_crypto_tests/modules/details/useCase/get_crypto_market_chart_useCase.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/controllers/provider.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/controllers/providers.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'fake_data.dart';

class SetupWidgetTesterWithProviders extends StatelessWidget {
  final Widget child;
  const SetupWidgetTesterWithProviders({Key? key, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getFakeCryptoData = Provider((ref) {
      return FakeCryptoDataRepository();
    });
    final ableToExchangeProviderTest = StateProvider<bool>(
      (ref) => true,
    );
    final getMarketChartDataProviderTest = Provider((ref) {
      return GetCryptoMarketChartUseCase(
        repository: FakeMarketChartRepository(),
      );
    });
    final marketChartDataProviderTest =
        FutureProvider.autoDispose.family<MarketChartViewData, dynamic>(
      ((ref, args) async {
        return await ref.read(getMarketChartDataProvider).start(args);
      }),
    );
    final cryptoBeingExchangedDataProviderTest =
        StateProvider<CryptoDataViewData>(
      (ref) => CryptoDataViewData(
        id: 'btc',
        symbol: 'btc',
        name: '',
        image: '',
        current_price: 5,
        market_cap_change_percentage_24h: 5,
      ),
    );
    final moneyToExchangeProviderTest = StateProvider<double>(
      (ref) => 5,
    );

    return ProviderScope(
      overrides: [
        getCryptosDataProvider.overrideWithProvider(getFakeCryptoData),
        getMarketChartDataProvider
            .overrideWithProvider(getMarketChartDataProviderTest),
        marketChartDataProvider
            .overrideWithProvider(marketChartDataProviderTest),
        ableToExchangeProvider.overrideWithProvider(ableToExchangeProviderTest),
        cryptoBeingExchangedDataProvider
            .overrideWithProvider(cryptoBeingExchangedDataProviderTest),
        moneyToExchangeProvider
            .overrideWithProvider(moneyToExchangeProviderTest)
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

Future<void> loadPageWithProviders(WidgetTester tester, Widget child) async {
  var widget = SetupWidgetTesterWithProviders(child: child);
  await tester.pumpWidget(widget);
}
