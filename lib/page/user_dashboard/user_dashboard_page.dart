import 'package:automatic_toll_app/model/driver_user.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/driver_toll_transaction.dart';
import '../../size_config.dart';
import '../login/login-page.dart';
import 'component/fund_details_widget.dart';
import 'component/toll_transactions_list_widget.dart';

class UserDashboardPage extends StatelessWidget {
  UserDashboardPage({Key? key, required this.driverUser}) : super(key: key);

  final DriverUser driverUser;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      body: buildBody(context),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                "Logout",
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        driverUser.fullname,
        style: TextStyle(
          color: Colors.white,
          fontSize: getProportionateScreenWidth(22),
        ),
      ),
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                FundDetailsWidget(driverUser: driverUser),
                SizedBox(height: getProportionateScreenHeight(20)),
                TollTransactionsListWidget(
                  tollTransactions: sampleDriverTollTransactions,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
