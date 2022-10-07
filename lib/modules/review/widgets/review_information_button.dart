import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/controllers/user_transaction_notifier.dart';
import '../../sucess/sucess_page.dart';
import '../../transactions/model/transactions_model.dart';

enum ButtonState { init, loading, done }

class ReviewInformationButton extends ConsumerStatefulWidget {
  String cryptoBeingExchangedInfo;
  String cryptoToExchangedInfo;
  String moneyBeingExchangedInfo;
  String exchangeEqualsTo;
  ReviewInformationButton({
    Key? key,
    required this.cryptoBeingExchangedInfo,
    required this.cryptoToExchangedInfo,
    required this.moneyBeingExchangedInfo,
    required this.exchangeEqualsTo,
  }) : super(key: key);

  @override
  ConsumerState<ReviewInformationButton> createState() =>
      _ReviewInformationButtonState();
}

class _ReviewInformationButtonState
    extends ConsumerState<ReviewInformationButton> {
  ButtonState state = ButtonState.init;
  double width = 343;
  bool isAnimating = true;

  @override
  Widget build(BuildContext context) {
    bool isStreched = state == ButtonState.init;
    bool isDone = state == ButtonState.done;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      onEnd: () => setState(() => isAnimating = !isAnimating),
      height: 50,
      width: width,
      child: isStreched
          ? Container(
              key: const Key('initContainer'),
              margin: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                key: const Key('initContainerButton'),
                onPressed: () async {
                  setState(() => width = 46);
                  await Future.delayed(
                    const Duration(milliseconds: 500),
                  );
                  setState(() => state = ButtonState.loading);
                  await Future.delayed(
                    const Duration(seconds: 2),
                  );
                  setState(() => state = ButtonState.done);
                  await Future.delayed(const Duration(milliseconds: 500), () {
                    ref.read(movementsProvider.notifier).state.add(
                          TransactionsModel(
                            cryptoBeingExchangedInfo:
                                widget.cryptoBeingExchangedInfo,
                            cryptoToExchangeInfo: widget.cryptoToExchangedInfo,
                            moneyBeingExchangedInfo:
                                widget.moneyBeingExchangedInfo,
                            date: DateTime.now(),
                            exchangeEqualsTo: widget.exchangeEqualsTo,
                          ),
                        );
                    return Navigator.pushNamed(
                      context,
                      SuccessPage.route,
                    );
                  });
                  setState(() {
                    state = ButtonState.init;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: kDefaultRed),
                ),
                color: kDefaultRed,
                child: Text(
                  AppLocalizations.of(context)!.convert,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            )
          : SmallButton(isDone),
    );
  }

  Widget SmallButton(bool isDone) => Container(
        key: const Key('loadingButton'),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isDone ? const Color(0xffD6FFDF) : kDefaultRed,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SizedBox(
            height: 22,
            width: 22,
            child: isDone
                ? const Hero(
                    tag: 'check',
                    child: Icon(
                      Icons.check,
                      color: Color(0xff0C5F2C),
                    ),
                  )
                : const CircularProgressIndicator(
                    color: Colors.white70,
                    strokeWidth: 3,
                  ),
          ),
        ),
      );
}
