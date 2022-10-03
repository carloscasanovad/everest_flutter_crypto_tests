import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../review/model/review_arguments.dart';
import '../../review/views/review_page.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../controllers/provider.dart';

class BottomSheetWidget extends HookConsumerWidget {
  double cryptoBalance;
  CryptoDataViewData cryptoToExchangeData;
  BottomSheetWidget({
    Key? key,
    required this.cryptoBalance,
    required this.cryptoToExchangeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CryptoDataViewData cryptoBeingExchangedData =
        ref.watch(cryptoBeingExchangedDataProvider);
    bool ableToExchange = ref.watch(ableToExchangeProvider);
    double moneyToExchange = ref.watch(moneyToExchangeProvider);
    double estimatedValue =
        moneyToExchange / cryptoBeingExchangedData.current_price;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kDefaultSoftGrey,
          ),
        ),
      ),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.total,
                style: kDefaultGreyTitleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                moneyToExchange != 0
                    ? '${estimatedValue.toStringAsFixed(6)} ${cryptoBeingExchangedData.symbol.toUpperCase()}'
                    : '',
                style: kDefaultParagraphStyle,
              ),
            ],
          ),
          FloatingActionButton(
            isExtended: true,
            backgroundColor: ableToExchange ? kDefaultRed : kDefaultSoftGrey,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: () {
              if (ableToExchange) {
                Navigator.pushNamed(
                  context,
                  ReviewPage.route,
                  arguments: ReviewArguments(
                    cryptoToExchangeValue:
                        moneyToExchange / cryptoToExchangeData.current_price,
                    cryptoToExchangeData: cryptoToExchangeData,
                    cryptoBeingExchangedValue: estimatedValue,
                    cryptoBeingExchangeData: cryptoBeingExchangedData,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
