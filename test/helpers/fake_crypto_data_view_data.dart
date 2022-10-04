import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:faker/faker.dart';

class FakeCryptoDataRepository {
  CryptoDataViewData getData() {
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
}
