import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Project Arguments', () {
    test('WHEN', () {
      ExchangeArguments exchangeArguments = ExchangeArguments(
          crypto: CryptoDataViewData(
              id: 'id',
              symbol: 'symbol',
              name: 'name',
              image: 'image',
              current_price: 100,
              market_cap_change_percentage_24h: 100),
          cryptoBalance: 100,
          cryptoValue: 100);

      expect(exchangeArguments.crypto.id.isNotEmpty, true);
      expect(exchangeArguments.crypto.symbol, 'symbol');
      expect(exchangeArguments.crypto.market_cap_change_percentage_24h.isFinite,
          true);
      expect(exchangeArguments.crypto.market_cap_change_percentage_24h.isFinite,
          true);
      expect(exchangeArguments.crypto.image.contains('image'), true);
      expect(exchangeArguments.crypto.name.isNotEmpty, true);
      expect(exchangeArguments.cryptoBalance.isFinite, true);
      expect(exchangeArguments.cryptoValue, 100);
    });
  });
}
