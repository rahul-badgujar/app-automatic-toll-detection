import 'package:automatic_toll_app/service/bluetooth/bluetooth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../constants.dart';
import '../../size_config.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({Key? key}) : super(key: key);

  @override
  State<BluetoothPage> createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(context),
    );
  }

  @override
  void initState() {
    BluetoothServicesWrapper.instance.startScan();
    super.initState();
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(screenPadding),
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text(
              "Available Devices",
              style: headingStyle.copyWith(
                fontSize: getProportionateScreenHeight(36),
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Expanded(
              child: buildAvailableDevicesList(),
            )
          ],
        ),
      ),
    ));
  }

  Widget buildAvailableDevicesList() {
    return StreamBuilder<List<BluetoothDevice>>(
      stream: BluetoothServicesWrapper.instance.getAvailableDevices(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        final availableDevices = snapshot.data ?? [];
        return ListView.builder(
          itemCount: availableDevices.length,
          itemBuilder: ((context, index) {
            final device = availableDevices[index];
            return buildDeviceListItem(device);
          }),
        );
      }),
    );
  }

  Widget buildDeviceListItem(BluetoothDevice device) {
    return ListTile(
      title: Text(device.name),
    );
  }
}
