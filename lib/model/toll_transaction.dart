abstract class TollTransaction {
  final String tollName;
  final double amountDeducted;
  final DateTime timestamp;

  TollTransaction({
    required this.tollName,
    required this.amountDeducted,
    required this.timestamp,
  });
}
