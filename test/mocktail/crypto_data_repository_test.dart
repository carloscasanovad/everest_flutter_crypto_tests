import 'package:dio/dio.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/repositories/crypto_data_repository.dart';
import 'package:everest_flutter_crypto_tests/shared/api/crypto_base_endpoint.dart';
import 'package:everest_flutter_crypto_tests/shared/api/model/crypto_data_response.dart';
import 'package:faker/faker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../helpers/api_factory.dart';

class CryptoDataEndpointMock extends Mock implements CryptoBaseEndpoint {}

void main() {
  late CryptoDataEndpointMock cryptoDataEndpointMock;
  late CryptoDataRepository sut;

  setUp(() {
    cryptoDataEndpointMock = CryptoDataEndpointMock();
    sut = CryptoDataRepository(baseEndpoint: cryptoDataEndpointMock);
  });

  test(
      'WHEN getAllCryptosData is requested by CryptoDataRepository, THEN ensure call getAllCryptoData from CryptoBaseEndpoint',
      (() async {
    when((() => cryptoDataEndpointMock.getCryptosData())).thenAnswer(
        (_) async => Response(
            data: ApiFactory.getCryptosData(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));

    final cryptoData = await sut.getAllCryptosData();

    verify(() => cryptoDataEndpointMock.getCryptosData()).called(1);
    expect(cryptoData.first.id.isNotEmpty, true);
    expect(cryptoData.first.image.isNotEmpty, true);
    expect(cryptoData.first.current_price.isFinite, true);
    expect(cryptoData.first.market_cap_change_percentage_24h.isFinite, true);
    expect(cryptoData.first.name.isNotEmpty, true);
    expect(cryptoData.first.symbol.isNotEmpty, true);
  }));
}
