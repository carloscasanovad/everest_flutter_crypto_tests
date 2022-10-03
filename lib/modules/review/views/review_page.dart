import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/widgets/default_appbar.dart';
import '../model/review_arguments.dart';
import '../widgets/body_review_page.dart';

class ReviewPage extends StatelessWidget {
  ReviewArguments reviewArguments;

  ReviewPage({
    Key? key,
    required this.reviewArguments,
  }) : super(key: key);

  static const route = 'review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.confirm,
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icons.arrow_back_ios_new_outlined,
      ),
      body: BodyReviewPage(
        reviewArguments: reviewArguments,
      ),
    );
  }
}
