import 'package:everest_flutter_crypto_tests/modules/details/mapper/market_chart_mapper.dart';

import '../model/market_chart_view_data.dart';
import '../repositories/market_chart_repository.dart';

class GetCryptoMarketChartUseCase {
  final MarketChartRepository repository;

  GetCryptoMarketChartUseCase({required this.repository});

  Future<MarketChartViewData> start(String crypto) async {
    final response = await repository.getCryptoMarketData(crypto);

    return response.toViewMarketChartData();
  }
}
