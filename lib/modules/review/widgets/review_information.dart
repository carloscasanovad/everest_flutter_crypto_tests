import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../model/review_arguments.dart';
import 'review_information_button.dart';

class ReviewInformation extends StatelessWidget {
  ReviewArguments reviewArguments;
  ReviewInformation({
    Key? key,
    required this.reviewArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formater = NumberFormat("#,##0.00", "pt");

    double exchange = reviewArguments.cryptoToExchangeData.current_price /
        reviewArguments.cryptoBeingExchangeData.current_price;
    String cryptoBeingExchangedSymbol =
        reviewArguments.cryptoBeingExchangeData.symbol.toUpperCase();
    String cryptoToExchangeSymbol =
        reviewArguments.cryptoToExchangeData.symbol.toUpperCase();

    String cryptoBeingExchangedInfo =
        '${reviewArguments.cryptoToExchangeValue.toString()} $cryptoToExchangeSymbol';
    String cryptoToExchangedInfo =
        '${reviewArguments.cryptoBeingExchangedValue.toStringAsFixed(6)} $cryptoBeingExchangedSymbol';
    String exchangeEqualsTo =
        '1$cryptoToExchangeSymbol = ${exchange.toStringAsFixed(6)} $cryptoBeingExchangedSymbol';
    String moneyBeingExchangedInfo =
        'R\$ ${formater.format(reviewArguments.cryptoBeingExchangedValue * reviewArguments.cryptoBeingExchangeData.current_price).toString()}';
    Map<String, String> rowInformation = {
      AppLocalizations.of(context)!.payWith: cryptoBeingExchangedInfo,
      AppLocalizations.of(context)!.receive: cryptoToExchangedInfo,
      AppLocalizations.of(context)!.exchangeRate: exchangeEqualsTo,
    };

    return Column(
      children: [
        const Divider(
          height: 1,
          thickness: 1,
        ),
        Expanded(
          child: ListView.separated(
            physics: const ScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        rowInformation.keys.elementAt(index),
                        style: kSubtitleTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        rowInformation.values.elementAt(index).toString(),
                        style: kDefaultParagraphStyle,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: rowInformation.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 1,
              thickness: 1,
            ),
          ),
        ),
        ReviewInformationButton(
          cryptoBeingExchangedInfo: cryptoBeingExchangedInfo,
          cryptoToExchangedInfo: cryptoToExchangedInfo,
          moneyBeingExchangedInfo: moneyBeingExchangedInfo,
          exchangeEqualsTo: exchangeEqualsTo,
        ),
      ],
    );
  }
}
