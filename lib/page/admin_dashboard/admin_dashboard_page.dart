import 'package:automatic_toll_app/model/admin_toll_transaction.dart';
import 'package:automatic_toll_app/page/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/admin_user.dart';
import '../../model/driver_toll_transaction.dart';
import '../../size_config.dart';
import 'component/toll_collected_details_widget.dart';
import 'component/toll_transactions_list_widget.dart';

class AdminDashboardPage extends StatelessWidget {
  AdminDashboardPage({Key? key, required this.adminUser}) : super(key: key);

  final AdminUser adminUser;

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
        adminUser.fullname,
        style: TextStyle(
          color: Colors.white,
          fontSize: getProportionateScreenWidth(22),
        ),
      ),
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.white,
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
                TollCollectedDetailsWidget(adminUser: adminUser),
                SizedBox(height: getProportionateScreenHeight(20)),
                TollTransactionsListWidget(
                  tollTransactions: sampleAdminTollTransactions,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
