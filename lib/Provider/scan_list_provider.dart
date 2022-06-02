import 'package:flutter/material.dart';
import 'package:fl_code_qr/Provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  //String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    scans.add(nuevoScan);
    notifyListeners();

    // Asignar el ID de la base de datos al modelo
    //final id = await DBProvider.db.nuevoScan(nuevoScan);
    //  nuevoScan.id = id;
    // if (this.tipoSeleccionado == nuevoScan.tipo) {
    //   this.scans.add(nuevoScan);
    //   notifyListeners();
    // }
    return nuevoScan;
  }

  cargarScans() async {
    //no usar esto
    final scans = await DBProvider.db.getTodosLosScans();
    // this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    //no usar esto
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    // this.scans = [...scans];
    // this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
