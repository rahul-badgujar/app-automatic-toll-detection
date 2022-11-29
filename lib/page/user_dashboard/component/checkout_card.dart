import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  final Function(int) onCheckoutPressed;

  const CheckoutCard({
    Key? key,
    required this.onCheckoutPressed,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  final amountFieldController = TextEditingController(text: '0');

  final otpFieldController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    amountFieldController.dispose();
    otpFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDADADA).withOpacity(0.6),
            offset: const Offset(0, -15),
            blurRadius: 20,
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    buildAmountFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildOtpFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildCheckoutButton(),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAmountFormField() {
    return TextFormField(
      controller: amountFieldController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "Enter amount in INR",
        labelText: "Amount (INR)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Amount cannot be empty";
        }
        final amount = int.tryParse(value) ?? 0;
        if (amount == 0) {
          return "Amount cannot be zero";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildOtpFormField() {
    return TextFormField(
      controller: otpFieldController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "Enter OTP received",
        labelText: "One Time Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
      maxLength: 4,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "OTP cannot be empty";
        } else if (value.length != 4) {
          return "OTP must have length 4";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onCheckoutClicked,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(defalutRadius * 0.8)),
          ),
        ),
        child: const Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void onCheckoutClicked() {
    final formState = _formkey.currentState;
    if (formState != null && formState.validate()) {
      final amountToAdd = int.tryParse(amountFieldController.value.text) ?? 0;
      widget.onCheckoutPressed(amountToAdd);
    }
  }
}
