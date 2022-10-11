import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/widgets/default_error_widget.dart';
import '../../../shared/widgets/default_loading_spinner.dart';
import '../controllers/providers.dart';
import '../model/crypto_data_arguments.dart';
import '../model/market_chart_view_data.dart';
import 'crypto_information.dart';
import 'details_line_chart.dart';
import 'line_chart_list_view_buttons.dart';

class DetailsBody extends StatelessWidget {
  CryptoDataArguments cryptoDataArguments;
  MarketChartViewData data;
  DetailsBody({
    required this.cryptoDataArguments,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsLineChart(marketChartData: data),
        LineChartListViewButtons(marketChartdata: data),
        CryptoInformation(
            key: const Key('criptoInformation'),
            marketChartData: data,
            cryptoDataArguments: cryptoDataArguments),
      ],
    );
  }
}
