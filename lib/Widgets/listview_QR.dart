import 'package:fl_code_qr/Models/scan_model.dart';
import 'package:fl_code_qr/Provider/scan_list_provider.dart';
import 'package:fl_code_qr/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewQRScreen extends StatelessWidget {
  final String tipoDato;

  const ListViewQRScreen({Key? key, required this.tipoDato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final objectScan = scanListProvider.scans;

    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_, i) {
        //Priorise que todo menos geo pueden entrar a esta lista

        if (tipoDato == 'geo') {
          if (!objectScan[i].valor.contains('geo')) {
            return const ListTile(title: null);
          }
        } else if (tipoDato == 'http') {
          if (objectScan[i].valor.contains('geo')) {
            return const ListTile(title: null);
          }
        } else {
          return Container(
            height: 20,
            width: double.infinity,
            color: Colors.red,
            child: Text('Este dato no existe carnal'),
          );
        }

        return Dismissible(
          key: UniqueKey(),
          background: Container(color: Colors.red),
          onDismissed: (DismissDirection direction) async {
            print(scanListProvider.scans.length);
            Provider.of<ScanListProvider>(context, listen: false)
                .scans
                .removeAt(i);
            Provider.of<ScanListProvider>(context, listen: false).cargarScans();
            // Provider.of<ScanListProvider>(context, listen: false)
            //     .borrarScanPorId(objectScan[i].id);
          },
          child: ListTile(
            leading: Icon(
              tipoDato == 'geo'
                  ? Icons.map_outlined
                  : Icons.compass_calibration_outlined,
              color: Theme.of(context).primaryColor,
            ),

            title: Text(objectScan[i].valor),
            //  subtitle: Text(objectScan[i].id.toString()),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () => launchURL(context, objectScan[i].valor),
          ),
        );
      },
    );
  }
}
