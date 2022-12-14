import 'package:automatic_toll_app/model/admin_user.dart';
import 'package:automatic_toll_app/model/driver_user.dart';
import 'package:automatic_toll_app/page/admin_dashboard/admin_dashboard_page.dart';
import 'package:automatic_toll_app/page/sign_up/sign_up_page.dart';
import 'package:automatic_toll_app/page/user_dashboard/user_dashboard_page.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../widget/custom_suffix_icon.dart';
import '../../../widget/default_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();

  final emailFieldController = TextEditingController();

  final passwordFieldController = TextEditingController();

  final isAdminLoginChangeNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    emailFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildForm(context);
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRoleField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Sign in",
            press: signInButtonCallback,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCreateAccountWidget(context),
        ],
      ),
    );
  }

  Widget buildCreateAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: const Text(
            "Create Account",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }

  Widget buildRoleField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: isAdminLoginChangeNotifier,
          builder: (context, isAdminLogin, _) {
            return Checkbox(
              value: isAdminLoginChangeNotifier.value,
              onChanged: (event) {
                isAdminLoginChangeNotifier.value = event ?? false;
              },
            );
          },
        ),
        const Text("I am Admin"),
      ],
    );
  }

  Widget buildEmailFormField() {
    return TextFormField(
      controller: emailFieldController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "Enter your email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
      validator: (value) {
        if (emailFieldController.text.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(emailFieldController.text)) {
          return kInvalidEmailError;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildPasswordFormField() {
    return TextFormField(
      controller: passwordFieldController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
      validator: (value) {
        if (passwordFieldController.text.isEmpty) {
          return kPassNullError;
        } else if (passwordFieldController.text.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> signInButtonCallback() async {
    final formState = _formkey.currentState;
    if (formState != null && formState.validate()) {
      _formkey.currentState!.save();
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => isAdminLoginChangeNotifier.value
            ? AdminDashboardPage(
                adminUser: AdminUser(
                  fullname: 'System Admin',
                  totalTollCollected: 24512.0,
                ),
              )
            : UserDashboardPage(
                driverUser: sampleDriverUser,
              ),
      ),
    );
  }
}
