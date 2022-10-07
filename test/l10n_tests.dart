import 'package:everest_flutter_crypto_tests/l10n/app_localizations_en.dart';
import 'package:everest_flutter_crypto_tests/l10n/app_localizations_es.dart';
import 'package:everest_flutter_crypto_tests/l10n/app_localizations_pt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/locale_widget_tester.dart';

main() {
  group(
      'Internationalization - Locale English',
      () => testWidgets(
            'WHEN project language is English, THEN ensure that every project word is in English',
            (WidgetTester tester) async {
              await loadPageWithSpecificLanguage(
                  tester, const Locale('en', ''));
              await tester.pump();
              expect(find.text(AppLocalizationsEn().crypto), findsOneWidget);
              expect(find.text(AppLocalizationsEn().userBalance), findsOneWidget);
              expect(find.text(AppLocalizationsEn().details), findsOneWidget);
              expect(find.text(AppLocalizationsEn().convertCrypto), findsOneWidget);
              expect(find.text(AppLocalizationsEn().currentPrice), findsOneWidget);
              expect(find.text(AppLocalizationsEn().priceVariation), findsOneWidget);
              expect(find.text(AppLocalizationsEn().userCryptoQuantity), findsOneWidget);
              expect(find.text(AppLocalizationsEn().userCryptoValue), findsOneWidget);
              expect(find.text(AppLocalizationsEn().exchange), findsWidgets);
              expect(find.text(AppLocalizationsEn().total), findsOneWidget);
              expect(find.text(AppLocalizationsEn().exchangeTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEn().insufficientFunds), findsOneWidget);
              expect(find.text(AppLocalizationsEn().totalBalance), findsOneWidget);
              expect(find.text(AppLocalizationsEn().confirm), findsWidgets);
              expect(find.text(AppLocalizationsEn().confirmTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEn().convert), findsOneWidget);
              expect(find.text(AppLocalizationsEn().payWith), findsOneWidget);
              expect(find.text(AppLocalizationsEn().receive), findsOneWidget);
              expect(find.text(AppLocalizationsEn().exchangeRate), findsOneWidget);
              expect(find.text(AppLocalizationsEn().portfolio), findsOneWidget);
              expect(find.text(AppLocalizationsEn().transactions), findsOneWidget);
              expect(find.text(AppLocalizationsEn().successTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEn().successSubtitle), findsOneWidget);
              expect(find.text(AppLocalizationsEn().transactionBillTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEn().transactionBillSubtitle), findsOneWidget);
              expect(find.text(AppLocalizationsEn().quantityConverted), findsOneWidget);
              expect(find.text(AppLocalizationsEn().quantityReceive), findsOneWidget);
            },
          ));
  group(
      'Internationalization - Locale Spanish',
      () => testWidgets(
            'WHEN project language is Spanish, THEN ensure that every project word is in Spanish',
            (WidgetTester tester) async {
              await loadPageWithSpecificLanguage(
                  tester, const Locale('es', ''));
              await tester.pump();
              expect(find.text(AppLocalizationsEs().crypto), findsOneWidget);
              expect(find.text(AppLocalizationsEs().userBalance), findsOneWidget);
              expect(find.text(AppLocalizationsEs().details), findsOneWidget);
              expect(find.text(AppLocalizationsEs().convertCrypto), findsOneWidget);
              expect(find.text(AppLocalizationsEs().currentPrice), findsOneWidget);
              expect(find.text(AppLocalizationsEs().priceVariation), findsOneWidget);
              expect(find.text(AppLocalizationsEs().userCryptoQuantity), findsOneWidget);
              expect(find.text(AppLocalizationsEs().userCryptoValue), findsOneWidget);
              expect(find.text(AppLocalizationsEs().exchange), findsWidgets);
              expect(find.text(AppLocalizationsEs().total), findsOneWidget);
              expect(find.text(AppLocalizationsEs().exchangeTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEs().insufficientFunds), findsOneWidget);
              expect(find.text(AppLocalizationsEs().totalBalance), findsOneWidget);
              expect(find.text(AppLocalizationsEs().confirm), findsWidgets);
              expect(find.text(AppLocalizationsEs().confirmTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEs().convert), findsOneWidget);
              expect(find.text(AppLocalizationsEs().payWith), findsOneWidget);
              expect(find.text(AppLocalizationsEs().receive), findsOneWidget);
              expect(find.text(AppLocalizationsEs().exchangeRate), findsOneWidget);
              expect(find.text(AppLocalizationsEs().portfolio), findsOneWidget);
              expect(find.text(AppLocalizationsEs().transactions), findsOneWidget);
              expect(find.text(AppLocalizationsEs().successTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEs().successSubtitle), findsOneWidget);
              expect(find.text(AppLocalizationsEs().transactionBillTitle), findsOneWidget);
              expect(find.text(AppLocalizationsEs().transactionBillSubtitle), findsOneWidget);
              expect(find.text(AppLocalizationsEs().quantityConverted), findsOneWidget);
              expect(find.text(AppLocalizationsEs().quantityReceive), findsOneWidget);
            },
          ));
  group(
      'Internationalization - Locale Portuguese',
      () => testWidgets(
            'WHEN project language is Portuguese, THEN ensure that every project word is in Portuguese',
            (WidgetTester tester) async {
              await loadPageWithSpecificLanguage(
                  tester, const Locale('pt', ''));
              await tester.pump();
              expect(find.text(AppLocalizationsPt().crypto), findsOneWidget);
              expect(find.text(AppLocalizationsPt().userBalance), findsOneWidget);
              expect(find.text(AppLocalizationsPt().details), findsOneWidget);
              expect(find.text(AppLocalizationsPt().convertCrypto), findsOneWidget);
              expect(find.text(AppLocalizationsPt().currentPrice), findsOneWidget);
              expect(find.text(AppLocalizationsPt().priceVariation), findsOneWidget);
              expect(find.text(AppLocalizationsPt().userCryptoQuantity), findsOneWidget);
              expect(find.text(AppLocalizationsPt().userCryptoValue), findsOneWidget);
              expect(find.text(AppLocalizationsPt().exchange), findsWidgets);
              expect(find.text(AppLocalizationsPt().total), findsOneWidget);
              expect(find.text(AppLocalizationsPt().exchangeTitle), findsOneWidget);
              expect(find.text(AppLocalizationsPt().insufficientFunds), findsOneWidget);
              expect(find.text(AppLocalizationsPt().totalBalance), findsOneWidget);
              expect(find.text(AppLocalizationsPt().confirm), findsWidgets);
              expect(find.text(AppLocalizationsPt().confirmTitle), findsOneWidget);
              expect(find.text(AppLocalizationsPt().convert), findsOneWidget);
              expect(find.text(AppLocalizationsPt().payWith), findsOneWidget);
              expect(find.text(AppLocalizationsPt().receive), findsOneWidget);
              expect(find.text(AppLocalizationsPt().exchangeRate), findsOneWidget);
              expect(find.text(AppLocalizationsPt().portfolio), findsOneWidget);
              expect(find.text(AppLocalizationsPt().transactions), findsOneWidget);
              expect(find.text(AppLocalizationsPt().successTitle), findsOneWidget);
              expect(find.text(AppLocalizationsPt().successSubtitle), findsOneWidget);
              expect(find.text(AppLocalizationsPt().transactionBillTitle), findsOneWidget);
              expect(find.text(AppLocalizationsPt().transactionBillSubtitle), findsOneWidget);
              expect(find.text(AppLocalizationsPt().quantityConverted), findsOneWidget);
              expect(find.text(AppLocalizationsPt().quantityReceive), findsOneWidget);
            },
          ));
}
