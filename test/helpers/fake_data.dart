import 'dart:math';

import 'package:everest_flutter_crypto_tests/modules/details/model/crypto_data_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/details/model/market_chart_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/details/repositories/market_chart_repository.dart';
import 'package:everest_flutter_crypto_tests/modules/details/useCase/get_crypto_market_chart_useCase.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/review/model/review_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/model/transactions_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_list_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/repositories/crypto_data_repository.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/user_wallet_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/useCases/get_cryptos_data_useCase.dart';
import 'package:everest_flutter_crypto_tests/shared/api/crypto_base_endpoint.dart';
import 'package:everest_flutter_crypto_tests/shared/api/model/crypto_data_response.dart';
import 'package:everest_flutter_crypto_tests/shared/api/model/market_data_response.dart';
import 'package:faker/faker.dart';

class FakeData {
  static CryptoDataViewData createCryptoViewData() {
    CryptoDataViewData repo = CryptoDataViewData(
      id: faker.guid.guid(),
      symbol: faker.guid.guid(),
      name: faker.guid.guid(),
      image: faker.internet.httpUrl(),
      current_price: faker.currency.random.decimal(scale: 15, min: 1),
      market_cap_change_percentage_24h:
          faker.currency.random.decimal(scale: 15, min: 1),
    );
    return repo;
  }

  static Future<CryptoListViewData> createFutureCryptoViewData() async {
    Future<CryptoListViewData> repo =
        Future.delayed(const Duration(seconds: 1), () {
      return CryptoListViewData(cryptoListDataView: [
        CryptoDataViewData(
          id: 'bitcoin',
          symbol: 'btc',
          name: 'btc',
          image: '',
          current_price: 100,
          market_cap_change_percentage_24h: 100,
        )
      ]);
    });
    return repo;
  }

  static createMarketChartViewData() {
    MarketChartViewData repo = MarketChartViewData(prices: [
      [faker.currency.random.integer(2), faker.currency.random.integer(2)],
      [faker.currency.random.integer(2), faker.currency.random.integer(2)],
      [faker.currency.random.integer(2), faker.currency.random.integer(2)],
      [faker.currency.random.integer(2), faker.currency.random.integer(2)],
      [faker.currency.random.integer(2), faker.currency.random.integer(2)],
      [faker.currency.random.integer(2), faker.currency.random.integer(2)],
      [faker.currency.random.integer(2), faker.currency.random.integer(2)],
    ]);
    return repo;
  }

  static CryptoDataArguments createCryptoDataArguments() {
    CryptoDataArguments repo = CryptoDataArguments(
      crypto: createCryptoViewData(),
      cryptoBalance: faker.currency.random.decimal(scale: 15, min: 1),
      cryptoValue: faker.currency.random.decimal(scale: 15, min: 1),
    );
    return repo;
  }

  static ExchangeArguments createExchangeArguments() {
    ExchangeArguments repo = ExchangeArguments(
        crypto: createCryptoViewData(),
        cryptoBalance: faker.currency.random.decimal(scale: 15, min: 1),
        cryptoValue: faker.currency.random.decimal(scale: 15, min: 1));
    return repo;
  }

  static ReviewArguments createReviewArguments() {
    ReviewArguments repo = ReviewArguments(
      cryptoToExchangeValue: faker.currency.random.decimal(scale: 15, min: 1),
      cryptoToExchangeData: createCryptoViewData(),
      cryptoBeingExchangedValue:
          faker.currency.random.decimal(scale: 15, min: 1),
      cryptoBeingExchangeData: createCryptoViewData(),
    );
    return repo;
  }

  static TransactionsModel createTransactionModel() {
    TransactionsModel repo = TransactionsModel(
        cryptoBeingExchangedInfo: faker.guid.guid(),
        cryptoToExchangeInfo: faker.guid.guid(),
        moneyBeingExchangedInfo: faker.guid.guid(),
        exchangeEqualsTo: faker.guid.guid(),
        date: faker.date.dateTime());
    return repo;
  }
}

class FakeCryptoDataRepository implements GetCryptosDataUseCase {
  @override
  Future<CryptoListViewData> execute() async {
    final response = FakeData.createFutureCryptoViewData();
    return response;
  }

  @override
  Future<List<UserWalletModel>> getWallet() async {
    final response = [
      CryptoDataResponse(
          current_price: 100,
          id: 'btc',
          image: 'btc',
          market_cap_change_percentage_24h: 100,
          name: 'btc',
          symbol: 'btc')
    ];
    List<UserWalletModel> cryptoWallet = [];
    for (var crypto in response) {
      cryptoWallet.add(UserWalletModel(
        id: crypto.id,
        userCryptoBalance: Random().nextInt(503) * 4,
      ));
    }
    return cryptoWallet;
  }

  @override
  // TODO: implement repository
  CryptoDataRepository get repository => throw UnimplementedError();
}
