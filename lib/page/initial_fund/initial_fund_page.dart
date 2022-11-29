import 'package:automatic_toll_app/page/login/login_page.dart';
import 'package:automatic_toll_app/widget/default_button.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/driver_user.dart';
import '../../size_config.dart';
import '../user_dashboard/component/checkout_card.dart';

class InitialFundPage extends StatefulWidget {
  const InitialFundPage({Key? key}) : super(key: key);

  @override
  State<InitialFundPage> createState() => _InitialFundPageState();
}

class _InitialFundPageState extends State<InitialFundPage> {
  late final PersistentBottomSheetController bottomSheetHandler;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(screenPadding)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                "Payment Wallet created successfully",
                style: headingStyle.copyWith(
                  fontSize: getProportionateScreenHeight(36),
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Expanded(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: getProportionateScreenHeight(160),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              DefaultButton(
                  text: "Add Initial Funds",
                  press: () {
                    bottomSheetHandler =
                        _scaffoldKey.currentState!.showBottomSheet(
                      (context) {
                        return CheckoutCard(
                          minimumAmount: 1000.0,
                          label: "Minimum required amount ₹1000",
                          onCheckoutPressed: (amountAdded) {
                            sampleDriverUser.balance = amountAdded;
                            bottomSheetHandler.close();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (_) => false,
                            );
                          },
                        );
                      },
                    );
                  }),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
