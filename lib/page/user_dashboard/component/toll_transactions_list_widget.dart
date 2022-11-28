import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/toll_transaction.dart';
import '../../../size_config.dart';

class TollTransactionsListWidget extends StatelessWidget {
  const TollTransactionsListWidget({
    Key? key,
    this.tollTransactions = const [],
  }) : super(key: key);

  final List<TollTransaction> tollTransactions;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: getProportionateScreenHeight(420),
      ),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defalutRadius),
          ),
        ),
        elevation: defaultElevation,
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  headingTextStyle: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  headingRowColor:
                      MaterialStateProperty.all(Colors.black.withOpacity(0.03)),
                  columns: ["Toll Name", "Amount Deducted", "Timestamp"]
                      .map((e) => DataColumn(label: Text(e)))
                      .toList(),
                  rows: tollTransactions.map((tollTransaction) {
                    return DataRow(cells: [
                      DataCell(
                        Text(tollTransaction.tollName),
                      ),
                      DataCell(
                        Text("₹ ${tollTransaction.amountDeducted}"),
                      ),
                      DataCell(
                        Text(tollTransaction.timestamp.toIso8601String()),
                      ),
                    ]);
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
