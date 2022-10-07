import 'package:dio/dio.dart';
import 'package:everest_flutter_crypto_tests/shared/api/crypto_base_endpoint.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<List<Map<String, dynamic>>> dataResponseSucess;
  late Response<Map<String, dynamic>> marketResponseSucess;
  late DioMock dioMock;
  late CryptoBaseEndpoint cryptoBaseEndpoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  group('WHEN using getCryptoData, THEN call data cryptoBaseEndpoint', () {
    mockResponse(List<Map<String, dynamic>> factory, int statusCode) =>
        Response(
            data: factory,
            statusCode: statusCode,
            requestOptions: RequestOptions(path: faker.internet.httpUrl()));

    setUp(() {
      dioMock = DioMock();
      cryptoBaseEndpoint = CryptoBaseEndpoint(dioMock);
    });

    setUp(() {
      dataResponseSucess = mockResponse(ApiFactory.getCryptosData(), 200);
    });
    test('WHEN getCryptosData is requested THEN returns 200', (() async {
      mockGetResponse().thenAnswer((_) async => dataResponseSucess);
      final result = await cryptoBaseEndpoint.getCryptosData();
      expect(result.statusCode, equals(200));
      expect(result, dataResponseSucess);
    }));
  });

  group('WHEN using getCryptoMarketChart, THEN call market cryptoBaseEndpoint',
      () {
    mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
        data: factory,
        statusCode: statusCode,
        requestOptions: RequestOptions(path: faker.internet.httpUrl()));

    setUp(() {
      dioMock = DioMock();
      cryptoBaseEndpoint = CryptoBaseEndpoint(dioMock);
    });

    setUp(() {
      marketResponseSucess =
          mockResponse(ApiFactory.getCryptoMarketChart(), 200);
    });
    test('WHEN getCryptoMarketChart is requested THEN returns 200', (() async {
      mockGetResponse().thenAnswer((_) async => marketResponseSucess);
      final result =
          await cryptoBaseEndpoint.getCryptoMarketChart(faker.guid.guid());
      expect(result.statusCode, equals(200));
      expect(result, marketResponseSucess);
    }));
  });
}
