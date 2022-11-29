import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/driver_user.dart';
import '../../../size_config.dart';
import 'checkout_card.dart';

class FundDetailsWidget extends StatefulWidget {
  FundDetailsWidget({
    Key? key,
    required this.driverUser,
  }) : super(key: key);

  final DriverUser driverUser;

  @override
  State<FundDetailsWidget> createState() => _FundDetailsWidgetState();
}

class _FundDetailsWidgetState extends State<FundDetailsWidget> {
  late final PersistentBottomSheetController bottomSheetHandler;

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
                  "₹ ${widget.driverUser.balance}",
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
                  onPressed: () {
                    bottomSheetHandler = Scaffold.of(context).showBottomSheet(
                      (context) {
                        return CheckoutCard(
                          onCheckoutPressed: (amountAdded) {
                            sampleDriverUser.balance += amountAdded;
                            bottomSheetHandler.close();
                            setState(() {});
                          },
                        );
                      },
                    );
                  },
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
