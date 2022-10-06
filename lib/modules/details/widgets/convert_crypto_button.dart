import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/constants/app_colors.dart';
import '../../exchange/model/exchange_arguments.dart';
import '../../exchange/views/exchange_page.dart';
import '../model/crypto_data_arguments.dart';

class ConvertCryptoButton extends StatelessWidget {
  CryptoDataArguments cryptoDataArguments;
  ConvertCryptoButton({
    Key? key,
    required this.cryptoDataArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            ExchangePage.route,
            arguments: ExchangeArguments(
              crypto: cryptoDataArguments.crypto,
              cryptoBalance: cryptoDataArguments.cryptoBalance,
              cryptoValue: cryptoDataArguments.cryptoValue,
            ),
          );
        },
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: kDefaultRed),
        ),
        color: kDefaultRed,
        child: Text(
          AppLocalizations.of(context)!.convertCrypto,
          style: const TextStyle(
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
