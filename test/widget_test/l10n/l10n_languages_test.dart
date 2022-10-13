import 'package:everest_flutter_crypto_tests/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/l10n_setup_widget_tester.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  test('WHEN appLocalizations call shouldReload, THEN expect a false value',
      () {
    expect(
        AppLocalizations.delegate.shouldReload.call(AppLocalizations.delegate),
        false);
  });

  group(
      'L10n - English',
      (() => testWidgets(
            'WHEN project language is in English, THEN ensure that every text on the project is in English',
            (WidgetTester tester) async {
              await loadPage(
                tester,
                const L10nSetupWidgetTester(
                  language: Locale('en', ''),
                ),
              );
              await tester.pumpAndSettle();

              expect(() => lookupAppLocalizations(const Locale('ro', '')),
                  throwsFlutterError);

              expect(find.text('Crypto'), findsOneWidget);
              expect(find.text('Total balance:'), findsOneWidget);
              expect(find.text('Details:'), findsOneWidget);
              expect(find.text('Convert crypto'), findsOneWidget);
              expect(find.text('Current price'), findsOneWidget);
              expect(find.text('Change %'), findsOneWidget);
              expect(find.text('Balance'), findsOneWidget);
              expect(find.text('Value'), findsOneWidget);
              expect(find.text('Exchange'), findsOneWidget);
              expect(find.text('Total:'), findsOneWidget);
              expect(find.text('How much would you like to convert?'),
                  findsOneWidget);
              expect(find.text('Insufficient funds!'), findsOneWidget);
              expect(find.text('Total balance'), findsOneWidget);
              expect(find.text('Confirm conversion'), findsWidgets);
              expect(find.text('Confirm your conversion'), findsOneWidget);
              expect(find.text('Convert'), findsOneWidget);
              expect(find.text('Pay with'), findsOneWidget);
              expect(find.text('Receive'), findsOneWidget);
              expect(find.text('Exchange rate'), findsOneWidget);
              expect(find.text('Portfolio'), findsOneWidget);
              expect(find.text('Transactions'), findsOneWidget);
              expect(find.text('Conversion completed'), findsOneWidget);
              expect(find.text('Your conversion was successfully completed!'),
                  findsOneWidget);
              expect(find.text('Bill of'), findsOneWidget);
              expect(find.text('exchange'), findsOneWidget);
              expect(find.text('Quantity converted'), findsOneWidget);
              expect(find.text('Quantity receive'), findsOneWidget);
            },
          )));
  group(
      'L10n - Spanish',
      (() => testWidgets(
            'WHEN project language is in Spanish, THEN ensure that every text on the project is in Spanish',
            (WidgetTester tester) async {
              await loadPage(tester,
                  const L10nSetupWidgetTester(language: Locale('es', '')));
              await tester.pumpAndSettle();

              expect(find.text('Cripto'), findsOneWidget);
              expect(find.text('Valor total de monedas:'), findsOneWidget);
              expect(find.text('Detalles:'), findsOneWidget);
              expect(find.text('Convertir cripto'), findsOneWidget);
              expect(find.text('Precio actual'), findsOneWidget);
              expect(find.text('Variación %'), findsOneWidget);
              expect(find.text('Cantidad'), findsOneWidget);
              expect(find.text('Valor'), findsOneWidget);
              expect(find.text('Convertir'), findsOneWidget);
              expect(find.text('Total estimado:'), findsOneWidget);
              expect(
                  find.text('Cuanto te gustaría convertir?'), findsOneWidget);
              expect(find.text('Saldo insuficiente!'), findsOneWidget);
              expect(find.text('Saldo disponible:'), findsOneWidget);
              expect(find.text('Confirmar conversión'), findsWidgets);
              expect(find.text('Revise los datos de su conversión'),
                  findsOneWidget);
              expect(find.text('Convertir para'), findsOneWidget);
              expect(find.text('Pagar con'), findsOneWidget);
              expect(find.text('Recibir'), findsOneWidget);
              expect(find.text('Cambio'), findsOneWidget);
              expect(find.text('Portafolio'), findsOneWidget);
              expect(find.text('Movimentaciones'), findsOneWidget);
              expect(find.text('Conversión realizada'), findsOneWidget);
              expect(find.text('Conversión de moneda realizada con éxito!'),
                  findsOneWidget);
              expect(find.text('Comprovante de'), findsOneWidget);
              expect(find.text('conversión'), findsOneWidget);
              expect(find.text('Cantidad convertida'), findsOneWidget);
              expect(find.text('Cantidad recibida'), findsOneWidget);
            },
          )));
  group(
      'L10n - Portugese',
      (() => testWidgets(
            'WHEN project language is in Portuguese, THEN ensure that every text on the project is in Portuguese',
            (WidgetTester tester) async {
              await loadPage(tester,
                  const L10nSetupWidgetTester(language: Locale('pt', '')));
              await tester.pumpAndSettle();

              expect(find.text('Cripto'), findsOneWidget);
              expect(find.text('Valor total de moedas:'), findsOneWidget);
              expect(find.text('Converter cripto'), findsOneWidget);
              expect(find.text('Preço atual'), findsOneWidget);
              expect(find.text('Variação'), findsOneWidget);
              expect(find.text('Quantidade'), findsOneWidget);
              expect(find.text('Valor'), findsOneWidget);
              expect(find.text('Converter'), findsOneWidget);
              expect(find.text('Total estimado:'), findsOneWidget);
              expect(find.text('Quanto você gostaria de converter?'),
                  findsOneWidget);
              expect(find.text('Saldo insuficiente!'), findsOneWidget);
              expect(find.text('Saldo disponivel:'), findsOneWidget);
              expect(find.text('Confirmar conversão'), findsWidgets);
              expect(
                  find.text('Revise os dados da su conversão'), findsOneWidget);
              expect(find.text('Converter para'), findsOneWidget);
              expect(find.text('Pagar com'), findsOneWidget);
              expect(find.text('Receber'), findsOneWidget);
              expect(find.text('Câmbio'), findsOneWidget);
              expect(find.text('Portfolio'), findsOneWidget);
              expect(find.text('Movimentacões'), findsOneWidget);
              expect(find.text('Conversão efetuada'), findsOneWidget);
              expect(find.text('Conversão de moeda efetuada com sucesso!'),
                  findsOneWidget);
              expect(find.text('Comprovante de'), findsOneWidget);
              expect(find.text('conversão'), findsOneWidget);
              expect(find.text('Quantidade convertida'), findsOneWidget);
              expect(find.text('Quantidade recebida'), findsOneWidget);
            },
          )));
}
