import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_data_arguments.dart';
import '../model/market_chart_view_data.dart';
import '../widgets/convert_crypto_button.dart';
import '../widgets/details_body.dart';
import '../widgets/details_header.dart';

class DetailsScreen extends StatelessWidget {
  CryptoDataArguments cryptoDataArguments;
  MarketChartViewData data;
  DetailsScreen({
    required this.cryptoDataArguments,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          DetailsHeader(cryptoDataArguments: cryptoDataArguments),
          DetailsBody(cryptoDataArguments: cryptoDataArguments, data: data),
          ConvertCryptoButton(cryptoDataArguments: cryptoDataArguments),
        ],
      ),
    );
  }
}
