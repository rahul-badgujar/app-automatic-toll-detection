import 'package:automatic_toll_app/page/enum/vehicle_type.dart';

import 'user.dart';

class DriverUser extends User {
  final double balance;
  final String phoneNumber;
  final String address;
  final String aadharNumber;
  final String vehicleLicenceNumber;
  final VehicleType vehicleType;
  final String vehicleNumber;
  final String vehicleRegistrationCertificateNumber;
  final String bankName;
  final String bankAccountNumber;
  final String bankIfscCode;
  final String bankAccountHolderName;

  DriverUser({
    required super.fullname,
    required this.phoneNumber,
    required this.address,
    required this.aadharNumber,
    required this.vehicleLicenceNumber,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.vehicleRegistrationCertificateNumber,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankIfscCode,
    required this.bankAccountHolderName,
    this.balance = 0.0,
  });
}

final sampleDriverUser = DriverUser(
  fullname: 'Rahul Badgujar',
  phoneNumber: '7775919753',
  address: 'Sinnar, Nashik 422113',
  aadharNumber: '123456789012',
  vehicleLicenceNumber: 'MH16 RB7777',
  vehicleNumber: 'V10003',
  vehicleType: VehicleType.car,
  vehicleRegistrationCertificateNumber: 'RC00099',
  bankName: 'ICICI',
  bankAccountNumber: '434658945893',
  bankIfscCode: 'IC1005',
  bankAccountHolderName: 'Rahul Badgujar',
);
