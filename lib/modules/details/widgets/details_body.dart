import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/widgets/default_error_widget.dart';
import '../../../shared/widgets/default_loading_spinner.dart';
import '../model/crypto_data_arguments.dart';
import '../controllers/providers.dart';
import 'crypto_information.dart';
import 'details_line_chart.dart';
import 'line_chart_list_view_buttons.dart';

class DetailsBody extends HookConsumerWidget {
  CryptoDataArguments cryptoDataArguments;
  DetailsBody({
    required this.cryptoDataArguments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String cryptoId = cryptoDataArguments.crypto.id;
    final marketChartData = ref.watch(marketChartDataProvider(cryptoId));
    return marketChartData.when(
      data: (data) {
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
      },
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return const DefaultErrorWidget();
      },
      loading: () => const DefaultLoadingSpinner(),
    );
  }
}
