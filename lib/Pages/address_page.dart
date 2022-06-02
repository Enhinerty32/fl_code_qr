import 'package:fl_code_qr/Widgets/listview_QR.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListViewQRScreen(
      tipoDato: 'http',
    );
  }
}
