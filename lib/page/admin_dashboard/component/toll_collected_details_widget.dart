import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/admin_user.dart';
import '../../../size_config.dart';

class TollCollectedDetailsWidget extends StatelessWidget {
  const TollCollectedDetailsWidget({
    Key? key,
    required this.adminUser,
  }) : super(key: key);

  final AdminUser adminUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(defalutRadius),
        ),
      ),
      elevation: defaultElevation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Text(
              "Total Toll Collected",
              style: TextStyle(
                color: Colors.black87,
                fontSize: getProportionateScreenWidth(21),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹ ${adminUser.totalTollCollected}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: getProportionateScreenWidth(30),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
