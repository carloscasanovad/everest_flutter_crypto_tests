import 'package:everest_flutter_crypto_tests/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class ProjectTexts extends StatelessWidget {
  const ProjectTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.confirm),
        Text(AppLocalizations.of(context)!.crypto),
        Text(AppLocalizations.of(context)!.userBalance),
        Text(AppLocalizations.of(context)!.details),
        Text(AppLocalizations.of(context)!.convertCrypto),
        Text(AppLocalizations.of(context)!.currentPrice),
        Text(AppLocalizations.of(context)!.priceVariation),
        Text(AppLocalizations.of(context)!.userCryptoQuantity),
        Text(AppLocalizations.of(context)!.userCryptoValue),
        Text(AppLocalizations.of(context)!.exchange),
        Text(AppLocalizations.of(context)!.total),
        Text(AppLocalizations.of(context)!.exchangeTitle),
        Text(AppLocalizations.of(context)!.insufficientFunds),
        Text(AppLocalizations.of(context)!.totalBalance),
        Text(AppLocalizations.of(context)!.confirm),
        Text(AppLocalizations.of(context)!.confirmTitle),
        Text(AppLocalizations.of(context)!.convert),
        Text(AppLocalizations.of(context)!.payWith),
        Text(AppLocalizations.of(context)!.receive),
        Text(AppLocalizations.of(context)!.exchangeRate),
        Text(AppLocalizations.of(context)!.portfolio),
        Text(AppLocalizations.of(context)!.transactions),
        Text(AppLocalizations.of(context)!.successTitle),
        Text(AppLocalizations.of(context)!.successSubtitle),
        Text(AppLocalizations.of(context)!.transactionBillTitle),
        Text(AppLocalizations.of(context)!.transactionBillSubtitle),
        Text(AppLocalizations.of(context)!.quantityConverted),
        Text(AppLocalizations.of(context)!.quantityReceive),
      ],
    );
  }
}
