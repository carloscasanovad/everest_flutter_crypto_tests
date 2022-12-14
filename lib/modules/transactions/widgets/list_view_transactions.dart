import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/app_colors.dart';
import '../model/transactions_model.dart';
import 'list_tile_transactions.dart';

class ListViewTransactions extends ConsumerStatefulWidget {
  List<TransactionsModel> userTransactions;
  ListViewTransactions({
    super.key,
    required this.userTransactions,
  });

  @override
  ConsumerState<ListViewTransactions> createState() =>
      _ListViewTransactionsState();
}

class _ListViewTransactionsState extends ConsumerState<ListViewTransactions> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('listViewTransactions'),
      itemCount: widget.userTransactions.length,
      itemBuilder: (BuildContext context, int index) {
        var userTransaction = widget.userTransactions[index];
        String formattedDate =
            DateFormat.yMd('pt-br').format(userTransaction.date);

        return ListTileTransactions(
          userTransaction: userTransaction,
          formattedDate: formattedDate,
        );
      },
    );
  }
}
