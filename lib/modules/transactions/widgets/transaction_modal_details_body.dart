import 'package:flutter/material.dart';

import '../../../shared/constants/app_text_styles.dart';

class TransactionModalDetailsBody extends StatelessWidget {
  const TransactionModalDetailsBody({
    Key? key,
    required this.transactionDetails,
    required this.index,
  }) : super(key: key);

  final Map<String, String> transactionDetails;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                transactionDetails.keys.elementAt(index),
                style: kDefaultGreyParagraphStyle,
              ),
            ),
            Expanded(
              child: Text(
                transactionDetails.values.elementAt(index),
                style: kDefaultParagraphStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
