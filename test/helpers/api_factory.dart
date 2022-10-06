import 'package:faker/faker.dart';

class ApiFactory {
  static List<Map<String, dynamic>> getCryptosData() => [
        {
          "id": faker.guid.guid(),
          "symbol": faker.guid.guid(),
          "name": faker.guid.guid(),
          "image": faker.guid.guid(),
          "current_price": faker.currency.random.decimal(scale: 15, min: 1),
          "market_cap": faker.currency.random.decimal(scale: 15, min: 1),
          "market_cap_rank": faker.currency.random.decimal(scale: 15, min: 1),
          "fully_diluted_valuation":
              faker.currency.random.decimal(scale: 15, min: 1),
          "total_volume": faker.currency.random.decimal(scale: 15, min: 1),
          "high_24h": faker.currency.random.decimal(scale: 15, min: 1),
          "low_24h": faker.currency.random.decimal(scale: 15, min: 1),
          "price_change_24h": faker.currency.random.decimal(scale: 15, min: 1),
          "price_change_percentage_24h":
              faker.currency.random.decimal(scale: 15, min: 1),
          "market_cap_change_24h":
              faker.currency.random.decimal(scale: 15, min: 1),
          "market_cap_change_percentage_24h":
              faker.currency.random.decimal(scale: 15, min: 1),
          "circulating_supply":
              faker.currency.random.decimal(scale: 15, min: 1),
          "total_supply": faker.currency.random.decimal(scale: 15, min: 1),
          "max_supply": faker.currency.random.decimal(scale: 15, min: 1),
          "ath": faker.currency.random.decimal(scale: 15, min: 1),
          "ath_change_percentage":
              faker.currency.random.decimal(scale: 15, min: 1),
          "ath_date": faker.guid.guid(),
          "atl": faker.currency.random.decimal(scale: 15, min: 1),
          "atl_change_percentage":
              faker.currency.random.decimal(scale: 15, min: 1),
          "atl_date": faker.guid.guid(),
          "roi": faker.currency.random.decimal(scale: 15, min: 1),
          "last_updated": faker.guid.guid()
        },
      ];

  static Map<String, dynamic> getCryptoMarketChart() => {
        "prices": [
          [
            faker.currency.random.decimal(scale: 15, min: 1),
            faker.currency.random.decimal(scale: 15, min: 1)
          ],
          [
            faker.currency.random.decimal(scale: 15, min: 1),
            faker.currency.random.decimal(scale: 15, min: 1)
          ],
        ],
        "market_caps": [
          [
            faker.currency.random.decimal(scale: 15, min: 1),
            faker.currency.random.decimal(scale: 15, min: 1)
          ],
          [
            faker.currency.random.decimal(scale: 15, min: 1),
            faker.currency.random.decimal(scale: 15, min: 1)
          ],
        ],
        "total_volumes": [
          [
            faker.currency.random.decimal(scale: 15, min: 1),
            faker.currency.random.decimal(scale: 15, min: 1)
          ],
          [
            faker.currency.random.decimal(scale: 15, min: 1),
            faker.currency.random.decimal(scale: 15, min: 1)
          ],
        ],
      };
}
