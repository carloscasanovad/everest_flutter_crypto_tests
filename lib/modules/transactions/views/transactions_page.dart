import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../widgets/list_view_transactions.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});
  static const route = "/transaction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          key: const Key('mainPadding'),
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.transactions,
                style: kTitle3TextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                key: Key('mainDivider'),
                height: 10,
                thickness: 1,
                color: kDefaultLightGrey,
              ),
              const Expanded(child: ListViewTransactions()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
