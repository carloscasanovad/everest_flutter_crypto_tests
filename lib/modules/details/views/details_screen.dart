import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_data_arguments.dart';
import '../widgets/convert_crypto_button.dart';
import '../widgets/details_body.dart';
import '../widgets/details_header.dart';

class DetailsScreen extends HookConsumerWidget {
  CryptoDataArguments cryptoDataArguments;
  DetailsScreen({
    required this.cryptoDataArguments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          DetailsHeader(cryptoDataArguments: cryptoDataArguments),
          DetailsBody(cryptoDataArguments: cryptoDataArguments),
          ConvertCryptoButton(cryptoDataArguments: cryptoDataArguments),
        ],
      ),
    );
  }
}
