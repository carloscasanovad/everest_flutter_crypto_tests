import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/repositories/crypto_data_repository.dart';
import 'package:everest_flutter_crypto_tests/shared/api/crypto_base_endpoint.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CryptoDataEndpointSpy extends Mock implements CryptoBaseEndpoint {}

void main() {
  group("CryptoData Test", () {
    late CryptoDataEndpointSpy cryptoDataEndpointSpy;
    late CryptoDataRepository sut;
    String url = 'https://api.coingecko.com/api/v3/coins';

    setUp(() {
      cryptoDataEndpointSpy = CryptoDataEndpointSpy();
      sut = CryptoDataRepository(baseEndpoint: cryptoDataEndpointSpy);
    });

    test(
        "WHEN CryptoDataRepository call getCryptosData THEN return list of crypto coins",
        () async {
      when(() => cryptoDataEndpointSpy.getCryptosData().then(
            (_) async => Response(
              requestOptions: RequestOptions(path: url),
              data: jsonDecode(_.data),
            ),
          ));
    });
    expect(sut.getAllCryptosData(), []);
  });
}
