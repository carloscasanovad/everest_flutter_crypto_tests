// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:everest_flutter_crypto_tests/modules/details/repositories/market_chart_repository.dart';
// import 'package:everest_flutter_crypto_tests/modules/details/useCase/get_crypto_market_chart_useCase.dart';
// import 'package:everest_flutter_crypto_tests/modules/wallet/repositories/crypto_data_repository.dart';
// import 'package:everest_flutter_crypto_tests/modules/wallet/useCases/get_cryptos_data_useCase.dart';
// import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_page.dart';
// import 'package:everest_flutter_crypto_tests/modules/wallet/views/wallet_screen.dart';
// import 'package:everest_flutter_crypto_tests/shared/api/crypto_base_endpoint.dart';
// import 'package:everest_flutter_crypto_tests/shared/widgets/bottom_nav_bar.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'helpers/api_factory.dart';
// import 'helpers/setup_widget_tester.dart';

// class DioMock extends Mock implements Dio {}

// main() {
//   late DioMock dioMock;
//   late CryptoBaseEndpoint endpoint;
//   late MarketChartRepository repository;
//   late MarketChartRepository marketRepository;
//   late GetCryptosDataUseCase usecase;
//   late GetCryptoMarketChartUseCase marketDataUseCase;

//   setUp(() {
//     dioMock = DioMock();
//     endpoint = CryptoBaseEndpoint(dioMock);
//     repository = MarketChartRepository(baseEndpoint: endpoint);
//     marketRepository = MarketChartRepository(baseEndPoint: endpoint);
//     usecase = GetCryptosDataUseCase(repository: repository);
//     marketDataUseCase =
//         GetCryptoMarketChartUseCase(repository: marketRepository);
//   });

//   test('WHEN getAllCryptos THEN ensure mocktail object made request', () async {
//     when(() => dioMock.get(any())).thenAnswer(
//       (_) async => Response(
//         data: ApiFactory.getCryptosData(),
//         requestOptions: RequestOptions(path: ''),
//       ),
//     );

//     final list = await usecase.execute();

//     verify(() => dioMock.get(any()));
//     expect(list, isNotEmpty);
//   });
// }
