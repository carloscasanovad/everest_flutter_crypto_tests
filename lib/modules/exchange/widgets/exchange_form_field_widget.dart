import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../model/exchange_arguments.dart';
import '../controllers/provider.dart';

class ExchangeFormFieldWidget extends ConsumerStatefulWidget {
  ExchangeArguments exchangeArguments;
  List<CryptoDataViewData> cryptoList;
  ExchangeFormFieldWidget({
    Key? key,
    required this.exchangeArguments,
    required this.cryptoList,
  }) : super(key: key);

  @override
  ConsumerState<ExchangeFormFieldWidget> createState() =>
      _ExchangeFormFieldWidgetState();
}

class _ExchangeFormFieldWidgetState
    extends ConsumerState<ExchangeFormFieldWidget> {
  final formater = NumberFormat("#,##0.00", "pt");
  bool showMoneyHelper = true;
  double moneyToChange = 0;

  @override
  Widget build(BuildContext context) {
    ExchangeArguments args = widget.exchangeArguments;
    void handleOnChange(double moneyToChange, bool ableToChange) {
      ref.read(moneyToExchangeProvider.notifier).state = moneyToChange;
      ref.read(ableToExchangeProvider.notifier).state = ableToChange;
      showMoneyHelper = ableToChange;
    }

    Decimal toDecimal(double number) {
      return Decimal.parse(number.toString());
    }

    CryptoDataViewData cryptoData = ref.watch(cryptoBeingExchangedDataProvider);
    Decimal userCyptoBalance = toDecimal(args.cryptoBalance);
    String cryptoSymbol = args.crypto.symbol.toUpperCase();
    Decimal cryptoPrice = toDecimal(args.crypto.current_price);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: const TextStyle(
            fontSize: 28,
          ),
          onTap: () {
            if (cryptoData.id == '') {
              ref.read(cryptoBeingExchangedDataProvider.notifier).state =
                  widget.cryptoList[0];
            }
          },
          onChanged: (value) {
            if (value != '') {
              Decimal formattedValue =
                  Decimal.parse(value.replaceAll(RegExp(r','), '.'));
              moneyToChange =
                  formattedValue.toDouble() * cryptoPrice.toDouble();

              handleOnChange(moneyToChange, true);
              if (formattedValue > userCyptoBalance) {
                handleOnChange(0, false);
              }
              if (formattedValue.toDouble() == 0) {
                ref.read(ableToExchangeProvider.notifier).state = false;
              }
            }
            setState(() {});
          },
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^(\d+)?\,?\d{0,6}'),
            )
          ],
          decoration: InputDecoration(
            prefixIcon: Text(
              '$cryptoSymbol ',
              style: kHintInputFormTextStyle,
            ),
            isDense: true,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            hintText: '0,00',
            hintStyle: kHintInputFormTextStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          showMoneyHelper
              ? 'R\$ ${formater.format(moneyToChange)}'
              : AppLocalizations.of(context)!.insufficientFunds,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: showMoneyHelper ? kDefaultBlack : kDefaultRed,
          ),
        ),
      ],
    );
  }
}
