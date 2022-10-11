import 'dart:convert';

import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserWalletModel walletModel;
  setUp(() {
    walletModel = UserWalletModel(id: 'btc', userCryptoBalance: 100);
  });
  test(
    'WHEN UserWallet.toMap receives data, THEN ensure that the results are the given values',
    () {
      Map<String, dynamic> modelToMap = walletModel.toMap();
      expect(modelToMap['id'], 'btc');
      expect(modelToMap['userCryptoBalance'], 100);
    },
  );

  test('WHEN UserWallet.fromMap receives data, THEN ensure that the results are the given values', () {
    Map<String, dynamic> modelToMap = walletModel.toMap();
    UserWalletModel newWalletModel = UserWalletModel.fromMap(modelToMap);

    expect(newWalletModel.id, 'btc');
    expect(newWalletModel.userCryptoBalance, 100);
  });

  test('WHEN UserWallet.toJson receives data, THEN ensure that the results are the given values', () {
    String jsonModel = walletModel.toJson();
    expect(jsonModel, jsonEncode(walletModel.toMap()));
  });
  test('WHEN UserWallet.fromJson receives data, THEN ensure that the results are the given values', () {
    UserWalletModel newWalletModel =
        UserWalletModel.fromJson(walletModel.toJson());
    expect(newWalletModel.id, 'btc');
    expect(newWalletModel.userCryptoBalance, 100);
  });
}
