import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../widget/default_button.dart';
import '../../login/login-page.dart';

class PaymentWalletDetailsForm extends StatefulWidget {
  const PaymentWalletDetailsForm({Key? key}) : super(key: key);

  @override
  State<PaymentWalletDetailsForm> createState() =>
      _PaymentWalletDetailsFormState();
}

class _PaymentWalletDetailsFormState extends State<PaymentWalletDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  static const availableBanks = [
    "State Bank of India",
    "ICICI",
    "Axis Bank",
    "Canera Bank",
    "Bank of India"
  ];

  final accountNumberFieldController = TextEditingController();
  final ifscCodeFieldController = TextEditingController();
  final accountHoldNameFieldController = TextEditingController();
  final bankNameChangeNotifier = ValueNotifier(availableBanks[0]);

  @override
  void dispose() {
    accountNumberFieldController.dispose();
    ifscCodeFieldController.dispose();
    accountHoldNameFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(screenPadding)),
        child: Column(
          children: [
            buildBankNameDropdown(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAccountNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildIfscCodeFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAccountHolderNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Comple Registration",
              press: completeRegistrationButtonCallback,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBankNameDropdown() {
    return ValueListenableBuilder<String>(
      valueListenable: bankNameChangeNotifier,
      builder: ((context, bankName, child) {
        return DropdownButtonFormField<String>(
          value: bankName,
          items: availableBanks
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (updatedVehicleType) {
            bankNameChangeNotifier.value =
                updatedVehicleType ?? availableBanks[0];
          },
          decoration: const InputDecoration(
            labelText: "Select Bank Name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        );
      }),
    );
  }

  Widget buildAccountNumberFormField() {
    return TextFormField(
      controller: accountNumberFieldController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Enter your account number",
        labelText: "Account Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Account Number cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildIfscCodeFormField() {
    return TextFormField(
      controller: ifscCodeFieldController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Enter your IFSC Code",
        labelText: "IFSC Code",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "IFSC Code cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildAccountHolderNameFormField() {
    return TextFormField(
      controller: ifscCodeFieldController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: "Enter your Account Holder Name",
        labelText: "Account Holder Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "IAccount Holder Name cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> completeRegistrationButtonCallback() async {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      // todo: add/move account creation logic here
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
