import 'package:dio/dio.dart';
import 'package:everest_flutter_crypto_tests/modules/details/repositories/market_chart_repository.dart';
import 'package:everest_flutter_crypto_tests/modules/details/useCase/get_crypto_market_chart_useCase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/api_factory.dart';
import 'crypto_data_repository_test.dart';

main() {
  late CryptoDataEndpointMock cryptoDataEndpointMock;
  late MarketChartRepository marketChartRepository;
  late GetCryptoMarketChartUseCase sut;
  setUp(() {
    cryptoDataEndpointMock = CryptoDataEndpointMock();
    marketChartRepository =
        MarketChartRepository(baseEndPoint: cryptoDataEndpointMock);
    sut = GetCryptoMarketChartUseCase(repository: marketChartRepository);
  });

  test(
      'WHEN start is requested by GetCryptoMarketChartUseCase, THEN ensure call start from MarketChartRepository',
      (() async {
    when((() => cryptoDataEndpointMock.getCryptoMarketChart('bitcoin')))
        .thenAnswer((_) async => Response(
            data: ApiFactory.getCryptoMarketChart(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));

    final cryptoMarketData = await sut.start('bitcoin');
    expect(cryptoMarketData.prices.isNotEmpty, true);
  }));
}
