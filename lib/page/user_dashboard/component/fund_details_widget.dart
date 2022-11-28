import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/driver_user.dart';
import '../../../size_config.dart';

class FundDetailsWidget extends StatelessWidget {
  const FundDetailsWidget({
    Key? key,
    required this.driverUser,
  }) : super(key: key);

  final DriverUser driverUser;

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
              "Available Funds",
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
                  "₹ ${driverUser.balance}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: getProportionateScreenWidth(30),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(defalutRadius * 0.8)),
                    ),
                  ),
                  child: const Text(
                    "Add Funds",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
