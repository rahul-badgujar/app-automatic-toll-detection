import 'package:automatic_toll_app/page/payment_wallet_details/component/payment_wallet_details_form.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class PaymentWalletDetailsPage extends StatelessWidget {
  const PaymentWalletDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                "Payment Wallet Details",
                style: headingStyle,
              ),
              const Text(
                "Please fill in the given details",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              const PaymentWalletDetailsForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
