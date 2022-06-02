import 'package:fl_code_qr/Pages/Pages.dart';
import 'package:fl_code_qr/Provider/scan_list_provider.dart';
import 'package:fl_code_qr/Provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  /*Solo necesita llamar a este método si necesita inicializar el
   enlace antes de llamar a runApp .*/
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScanListProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Reader',
          initialRoute: 'home',
          routes: {
            'home': (BuildContext context) => const HomePage(),
            'map': (BuildContext context) => const MapPage()
          },
          theme: ThemeData(
              primaryColor: Colors.purple,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.purple),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.purple,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.purple))),
    );
  }
}
