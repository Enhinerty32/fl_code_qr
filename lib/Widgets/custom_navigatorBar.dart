
import 'package:fl_code_qr/Provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) {
        //se hace una llamada directa a selectMenuOpt  se puede realizar un
        //cambio directamente porque ya lo esta esperando
        uiProvider.selectMenuOpt = i;
      },
      currentIndex: currentIndex,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones')
      ],
    );
  }
}
