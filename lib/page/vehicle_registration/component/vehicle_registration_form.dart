import 'package:automatic_toll_app/page/enum/vehicle_type.dart';
import 'package:automatic_toll_app/page/payment_wallet_details/payment_wallet_details_page.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../widget/default_button.dart';

class VehicleRegistrationForm extends StatefulWidget {
  const VehicleRegistrationForm({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationForm> createState() =>
      _VehicleRegistrationFormState();
}

class _VehicleRegistrationFormState extends State<VehicleRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  static const DEFAULT_VEHICLE_TYPE = VehicleType.car;

  final vehicleNumberFieldController = TextEditingController();
  final vehicleRegistrationNumberFieldController = TextEditingController();
  final vehicleTypeChangeNotifier = ValueNotifier(DEFAULT_VEHICLE_TYPE);

  @override
  void dispose() {
    vehicleNumberFieldController.dispose();
    vehicleRegistrationNumberFieldController.dispose();
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
            buildVehicleTypeDropdown(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildVehicleNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildVehicleRegistrationNumberNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Save and Continue",
              press: saveAndContinueButtonCallback,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVehicleTypeDropdown() {
    return ValueListenableBuilder<VehicleType>(
      valueListenable: vehicleTypeChangeNotifier,
      builder: ((context, vehicleType, child) {
        return DropdownButtonFormField<VehicleType>(
          value: vehicleType,
          items: VehicleType.values
              .map(
                (e) => DropdownMenuItem<VehicleType>(
                  value: e,
                  child: Text(e.name.toUpperCase()),
                ),
              )
              .toList(),
          onChanged: (updatedVehicleType) {
            vehicleTypeChangeNotifier.value =
                updatedVehicleType ?? DEFAULT_VEHICLE_TYPE;
          },
          decoration: const InputDecoration(
            labelText: "Vehicle Type",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        );
      }),
    );
  }

  Widget buildVehicleNumberFormField() {
    return TextFormField(
      controller: vehicleNumberFieldController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Enter your vehicle number",
        labelText: "Vehicle Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Vehicle Number cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildVehicleRegistrationNumberNumberFormField() {
    return TextFormField(
      controller: vehicleRegistrationNumberFieldController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Enter your Vehicle Registration Certificate Number",
        labelText: "Vehicle Registration Certificate Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Vehicle Registration Certificate Number cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> saveAndContinueButtonCallback() async {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      // todo: add/move account creation logic here
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PaymentWalletDetailsPage(),
      ),
    );
  }
}
