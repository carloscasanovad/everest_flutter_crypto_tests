import 'package:dio/dio.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/repositories/crypto_data_repository.dart';
import 'package:everest_flutter_crypto_tests/modules/wallet/useCases/get_cryptos_data_useCase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/api_factory.dart';
import 'crypto_data_repository_test.dart';

main() {
  late CryptoDataEndpointMock cryptoDataEndpointMock;
  late CryptoDataRepository cryptoDataRepository;
  late GetCryptosDataUseCase sut;
  setUp(() {
    cryptoDataEndpointMock = CryptoDataEndpointMock();
    cryptoDataRepository =
        CryptoDataRepository(baseEndpoint: cryptoDataEndpointMock);
    sut = GetCryptosDataUseCase(repository: cryptoDataRepository);
  });

  test(
      'WHEN getWallet and execute is requested by GetCryptosDataUseCase, THEN ensure call getWallet and execute from GetCryptosDataUseCase',
      (() async {
    when((() => cryptoDataEndpointMock.getCryptosData())).thenAnswer(
        (_) async => Response(
            data: ApiFactory.getCryptosData(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));

    final userWallet = await sut.getWallet();
    final cryptoListViewData = await sut.execute();
    expect(userWallet.isNotEmpty, true);
    expect(cryptoListViewData.cryptoListDataView.isNotEmpty, true);
  }));
}
