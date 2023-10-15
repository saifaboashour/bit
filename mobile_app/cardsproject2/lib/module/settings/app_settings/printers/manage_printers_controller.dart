import 'dart:developer';

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:get/get.dart';

class ManagePrintersController extends GetxController {
  //Declarations
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  final RxList<BluetoothDevice> _printersList = <BluetoothDevice>[].obs;

  //Getters
  List<BluetoothDevice> get printersList => _printersList.toList();

  //Logic
  scanBluetoothPrinters() async {
    dynamic result = await bluetoothPrint.startScan(timeout: const Duration(seconds: 4));
    _printersList.addAll(result);
    log('Number of printers => ${printersList.length}');
    log('Number of printers => $result');
    //TODO: https://pub.dev/packages/bluetooth_print
  }

}