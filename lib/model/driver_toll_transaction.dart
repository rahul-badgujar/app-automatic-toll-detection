import 'package:automatic_toll_app/model/toll_transaction.dart';

class DriverTollTransaction extends TollTransaction {
  DriverTollTransaction(
      {required super.tollName,
      required super.amountDeducted,
      required super.timestamp});
}

final sampleDriverTollTransactions = <DriverTollTransaction>[
  DriverTollTransaction(
    tollName: 'Pimpalgaon Dhule Tollway',
    amountDeducted: 236.0,
    timestamp: DateTime.now().subtract(
      const Duration(
        days: 5,
        minutes: 34,
      ),
    ),
  ),
  DriverTollTransaction(
    tollName: 'Shirdi Nashik Tollway',
    amountDeducted: 129.0,
    timestamp: DateTime.now().subtract(
      const Duration(
        days: 10,
        minutes: 17,
        hours: 7,
      ),
    ),
  ),
  DriverTollTransaction(
    tollName: 'Nashik Pune Tollway',
    amountDeducted: 546.0,
    timestamp: DateTime.now().subtract(
      const Duration(
        days: 16,
        minutes: 56,
        hours: 2,
      ),
    ),
  ),
];
