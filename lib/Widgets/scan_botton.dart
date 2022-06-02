import 'package:fl_code_qr/Provider/scan_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../utils/url_launcher.dart';

class ScanBotton extends StatelessWidget {
  const ScanBotton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        // String barcodeScanRes = 'geo:39.698140935107475, -104.93338994198378';
        //String barcodeScanRes = 'https://www.youtube.com/';

        if (barcodeScanRes == -1) {
          return;
        }
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.nuevoScan(barcodeScanRes);
        launchURL(context, barcodeScanRes);

        ////

        //  print(barcodeScanRes);
        /*  final scanListProvider =  Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan('geo:23.123123.123');*/
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
