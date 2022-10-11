import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/default_appbar.dart';
import '../../../shared/widgets/default_error_widget.dart';
import '../../../shared/widgets/default_loading_spinner.dart';
import '../model/crypto_data_arguments.dart';
import '../controllers/providers.dart';
import 'details_screen.dart';

class DetailsPage extends HookConsumerWidget {
  CryptoDataArguments cryptoDataArguments;
  DetailsPage({
    Key? key,
    required this.cryptoDataArguments,
  }) : super(key: key);

  static const route = '/details';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String cryptoId = cryptoDataArguments.crypto.id;
    final marketChartData = ref.watch(marketChartDataProvider(cryptoId));
    return Scaffold(
        appBar: DefaultAppBar(
          title: AppLocalizations.of(context)!.details,
          onPressed: () {
            ref.read(chartDayProvider.notifier).state = 5;
            ref.read(chartIndexTappedProvider.notifier).state = 5;
            Navigator.of(context).pop();
          },
          icon: Icons.arrow_back_ios_new_outlined,
        ),
        body: marketChartData.when(
          data: (data) {
            return DetailsScreen(
              cryptoDataArguments: cryptoDataArguments,
              data: data,
            );
          },
          error: (error, stackTrace) {
            debugPrintStack(stackTrace: stackTrace);
            return const DefaultErrorWidget();
          },
          loading: () => const DefaultLoadingSpinner(),
        ));
  }
}
