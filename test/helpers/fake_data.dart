import 'package:everest_flutter_crypto_tests/modules/details/model/crypto_data_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/details/model/market_chart_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/review/model/review_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/transactions/model/transactions_model.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
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
