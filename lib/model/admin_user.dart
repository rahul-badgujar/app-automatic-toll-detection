import 'user.dart';

class AdminUser extends User {
  final double totalTollCollected;
  AdminUser({
    required super.fullname,
    required this.totalTollCollected,
  });
}
