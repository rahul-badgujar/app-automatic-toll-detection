import 'package:automatic_toll_app/model/toll_transaction.dart';
import 'package:automatic_toll_app/page/enum/vehicle_type.dart';

class AdminTollTransaction extends TollTransaction {
  final VehicleType vehicleType;
  final String vehicleLicencePlate;

  AdminTollTransaction({
    required this.vehicleType,
    required this.vehicleLicencePlate,
    required super.tollName,
    required super.amountDeducted,
    required super.timestamp,
  });
}

final sampleAdminTollTransactions = <AdminTollTransaction>[
  AdminTollTransaction(
    vehicleType: VehicleType.bus,
    vehicleLicencePlate: "MH15 XY6734",
    tollName: 'Nashik Pune Tollway',
    amountDeducted: 456.7,
    timestamp: DateTime.now().subtract(
      const Duration(
        days: 4,
        hours: 4,
        minutes: 2,
      ),
    ),
  ),
  AdminTollTransaction(
    vehicleType: VehicleType.car,
    vehicleLicencePlate: "MH14 AR5739",
    tollName: 'Nashik Dhule Tollway',
    amountDeducted: 456.7,
    timestamp: DateTime.now().subtract(
      const Duration(
        days: 8,
        hours: 2,
        minutes: 54,
      ),
    ),
  ),
];
