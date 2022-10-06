import 'package:dio/dio.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/repositories/crypto_data_repository.dart';
import 'package:everest_flutter_crypto_tests/shared/api/crypto_base_endpoint.dart';
import 'package:faker/faker.dart';
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

    await sut.getAllCryptosData();

    verify(() => cryptoDataEndpointMock.getCryptosData()).called(1);
  }));
}
