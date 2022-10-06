import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/default_appbar.dart';
import '../model/crypto_data_arguments.dart';
import '../controllers/providers.dart';
import '../widgets/details_body.dart';

class DetailsPage extends HookConsumerWidget {
  CryptoDataArguments cryptoDataArguments;
  DetailsPage({
    Key? key,
    required this.cryptoDataArguments,
  }) : super(key: key);

  static const route = '/details';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: DetailsBody(
        cryptoDataArguments: cryptoDataArguments,
      ),
    );
  }
}
