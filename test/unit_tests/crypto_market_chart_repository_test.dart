import 'package:dio/dio.dart';
import 'package:everest_flutter_crypto_tests/modules/details/repositories/market_chart_repository.dart';
import 'package:everest_flutter_crypto_tests/shared/api/crypto_base_endpoint.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/api_factory.dart';

class CryptoMarketChartEndpointMock extends Mock implements CryptoBaseEndpoint {
}

void main() {
  late CryptoMarketChartEndpointMock cryptoDataEndpointMock;
  late MarketChartRepository sut;
  String marketDataRequest = '';

  setUp(() {
    cryptoDataEndpointMock = CryptoMarketChartEndpointMock();
    sut = MarketChartRepository(baseEndPoint: cryptoDataEndpointMock);
    marketDataRequest = faker.guid.guid();
  });

  test(
      'WHEN getCryptoMarketChart is requested by MarketChartRepository, THEN ensure call getCryptoMarketChart from CryptoBaseEndpoint',
      (() async {
    when((() => cryptoDataEndpointMock.getCryptoMarketChart(marketDataRequest)))
        .thenAnswer((_) async => Response(
            data: ApiFactory.getCryptoMarketChart(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));

    await sut.getCryptoMarketData(marketDataRequest);

    verify(() => cryptoDataEndpointMock.getCryptoMarketChart(marketDataRequest))
        .called(1);
  }));
}
