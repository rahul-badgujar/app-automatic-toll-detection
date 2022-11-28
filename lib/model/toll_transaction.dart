class TollTransaction {
  final String tollName;
  final double amountDeducted;
  final DateTime timestamp;

  TollTransaction({
    required this.tollName,
    required this.amountDeducted,
    required this.timestamp,
  });
}

final sampleTollTransactions = <TollTransaction>[
  TollTransaction(
    tollName: 'Pimpalgaon Dhule Tollway',
    amountDeducted: 236.0,
    timestamp: DateTime.now().subtract(
      const Duration(
        days: 5,
        minutes: 34,
      ),
    ),
  ),
  TollTransaction(
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
  TollTransaction(
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
