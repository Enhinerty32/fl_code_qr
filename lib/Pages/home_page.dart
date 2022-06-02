import 'package:fl_code_qr/Pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:fl_code_qr/Widgets/widgets.dart';

import 'package:fl_code_qr/Provider/ui_provider.dart';
import 'package:fl_code_qr/Provider/scan_list_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ))
        ],
      ),
      body: _BodyHomePage(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanBotton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _BodyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Optener el UIProvider;
    final uiProvider = Provider.of<UiProvider>(context, listen: true);

    //Mostrar la pagina respectica
    final currentIndex = uiProvider.selectMenuOpt;

    //Usar ScanList Provider
    //resolver entregas de listas por providder
    switch (currentIndex) {
      case 0:
        //  scanListProvider.cargarScanPorTipo('geo');
        return const MapsPage();
      case 1:
        // scanListProvider.cargarScanPorTipo('http');
        return const AddressPage();

      default:
        return const MapsPage();
    }
  }
}
