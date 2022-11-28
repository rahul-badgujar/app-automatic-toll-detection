import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../widget/default_button.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({Key? key}) : super(key: key);

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();

  final phoneNumberFieldController = TextEditingController();
  final addressFieldController = TextEditingController();
  final aadharFieldController = TextEditingController();
  final drivingLicenceNumberFieldController = TextEditingController();

  @override
  void dispose() {
    phoneNumberFieldController.dispose();
    addressFieldController.dispose();
    aadharFieldController.dispose();
    drivingLicenceNumberFieldController.dispose();
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
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAddressFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAadharNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildDrivingLicennceNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Save and Continue",
              press: signUpButtonCallback,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPhoneNumberFormField() {
    return TextFormField(
      controller: phoneNumberFieldController,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        hintText: "Enter your phone number",
        labelText: "Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLength: 10,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Phone Number cannot be empty";
        } else if (value!.length != 10) {
          return "Phone number should be of 10 digits only";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildAddressFormField() {
    return TextFormField(
      controller: addressFieldController,
      keyboardType: TextInputType.streetAddress,
      decoration: const InputDecoration(
        hintText: "Enter your address",
        labelText: "Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLines: 3,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Address cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildAadharNumberFormField() {
    return TextFormField(
      controller: aadharFieldController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "Enter your aadhar number",
        labelText: "Aadhar Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLength: 12,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Aadhar Number cannot be empty";
        } else if (value!.length != 12) {
          return "Aadhar number should be of 12 digits only";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildDrivingLicennceNumberFormField() {
    return TextFormField(
      controller: drivingLicenceNumberFieldController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Enter your driver licence number",
        labelText: "Driver Licence Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Driver Licence Number cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> signUpButtonCallback() async {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      // todo: add/move account creation logic here
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const PersonalInfoPage(),
    //   ),
    // );
  }
}
