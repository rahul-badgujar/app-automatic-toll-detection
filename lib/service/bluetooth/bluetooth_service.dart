import 'package:flutter_blue/flutter_blue.dart';

class BluetoothServicesWrapper {
  BluetoothServicesWrapper._();
  static final BluetoothServicesWrapper instance = BluetoothServicesWrapper._();

  final FlutterBlue _internalServiceInstance = FlutterBlue.instance;

  Future<void> startScan() async {
    await _internalServiceInstance.startScan();
  }

  Future<void> stopScan() async {
    await _internalServiceInstance.stopScan();
  }

  Stream<List<BluetoothDevice>>? getAvailableDevices() {
    return _internalServiceInstance.scanResults.map((scanningResultsEvent) =>
        scanningResultsEvent.map((scanResult) => scanResult.device).toList());
  }

  Future<void> connectDevice(BluetoothDevice device) async {
    await device.connect();
  }

  Future<void> disconnectDevice(BluetoothDevice device) async {
    device.disconnect();
  }
}
