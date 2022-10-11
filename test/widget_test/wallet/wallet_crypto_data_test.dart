import 'dart:convert';

import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CryptoDataViewData cryptoModel;
  setUp(() {
    cryptoModel = CryptoDataViewData(
        current_price: 1,
        id: 'btc',
        image: 'btc',
        market_cap_change_percentage_24h: 1,
        name: 'btc',
        symbol: 'btc');
  });
  test(
    'WHEN CryptoDataViewData.toMap receives data, THEN ensure that the results are the given values',
    () {
      Map<String, dynamic> modelToMap = cryptoModel.toMap();
      expect(modelToMap['id'], 'btc');
      expect(modelToMap['current_price'], 1);
    },
  );

  test(
      'WHEN CryptoDataViewData.fromMap receives data, THEN ensure that the results are the given values',
      () {
    Map<String, dynamic> modelToMap = cryptoModel.toMap();
    CryptoDataViewData newCryptoModel = CryptoDataViewData.fromMap(modelToMap);

    expect(newCryptoModel.image, 'btc');
    expect(newCryptoModel.market_cap_change_percentage_24h.isFinite, true);
  });

  test(
      'WHEN CryptoDataViewData.toJson receives data, THEN ensure that the results are the given values',
      () {
    String jsonModel = cryptoModel.toJson();
    expect(jsonModel, jsonEncode(cryptoModel.toMap()));
  });
  test(
      'WHEN CryptoDataViewData.fromJson receives data, THEN ensure that the results are the given values',
      () {
    CryptoDataViewData newWalletModel =
        CryptoDataViewData.fromJson(cryptoModel.toJson());
    expect(newWalletModel.id.contains('bt'), true);
    expect(newWalletModel.name.isNotEmpty, true);
  });
}
