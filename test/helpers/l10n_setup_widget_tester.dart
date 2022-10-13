import 'package:everest_flutter_crypto_tests/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class L10nSetupWidgetTester extends StatelessWidget {
  final Locale language;
  const L10nSetupWidgetTester({
    Key? key,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: language,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Material(
        child: MediaQuery(
          data: MediaQueryData(),
          child: ProjectTexts(),
        ),
      ),
    ));
  }
}

class ProjectTexts extends StatelessWidget {
  const ProjectTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
      ),
    );
  }
}
