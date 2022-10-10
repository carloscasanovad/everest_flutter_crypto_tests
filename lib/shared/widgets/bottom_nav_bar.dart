import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../modules/transactions/views/transactions_page.dart';
import '../../modules/wallet/views/wallet_page.dart';
import '../constants/app_colors.dart';
import '../controllers/asset_provider.dart';
import '../controllers/providers.dart';

class BottomNavBar extends HookConsumerWidget {
  int index;
  BottomNavBar({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(
            context,
            WalletPage.route,
          );
          break;
        case 1:
          Navigator.pushNamed(
            context,
            TransactionsPage.route,
          );
          break;
      }
    }

    int selectedIndex = ref.watch(navBarIndexProvider);
    return BottomNavigationBar(
      key: const Key('bottomNavBar'),
      selectedItemColor: kDefaultRed,
      currentIndex: selectedIndex,
      onTap: (index) {
        ref.read(navBarIndexProvider.notifier).state = index;
        onItemTapped(index);
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const ImageIcon(
            key: Key('warrenIcon'),
            warrenIcon,
            size: 22,
          ),
          label: AppLocalizations.of(context)!.portfolio,
        ),
        BottomNavigationBarItem(
          icon: const ImageIcon(
            key: Key('cryptoCurrencyIcon'),
            cryptoCurrencyIcon,
            size: 24,
          ),
          label: AppLocalizations.of(context)!.transactions,
        ),
      ],
    );
  }
}
