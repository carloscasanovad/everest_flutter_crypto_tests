import 'dart:convert';

import 'package:everest_flutter_crypto_tests/shared/api/model/crypto_data_response.dart';
import 'package:everest_flutter_crypto_tests/shared/api/model/market_data_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CryptoData response', () {
    test(
        'WHEN cryptoDataResponse is send it toJson, then ensure that the response is the same',
        () async {
      CryptoDataResponse response = CryptoDataResponse(
          id: 'id',
          symbol: 'symbol',
          name: 'name',
          image: 'image',
          current_price: 100,
          market_cap_change_percentage_24h: 100);
      expect(response.toJson(), {
        'id': 'id',
        'symbol': 'symbol',
        'name': 'name',
        'image': 'image',
        'current_price': 100,
        'market_cap_change_percentage_24h': 100
      });
    });
  });
  group('MarketData response', () {
    late MarketDataResponse response;
    setUp(() {
      response = MarketDataResponse([
        [0, 1],
        [0, 2]
      ]);
    });
    test(
        'WHEN MarketDataResponse is send it toJson, then ensure that the response is the same',
        () async {
      expect(response.toString().isEmpty, false);
      expect(response.toJson(), {
        'prices': [
          [0, 1],
          [0, 2]
        ]
      });
      expect(response.prices.length, 2);
    });
  });
}
