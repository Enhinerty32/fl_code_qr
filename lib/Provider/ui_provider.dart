import 'package:flutter/Material.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOpt = 0;

//get recuperar un entero
  int get selectMenuOpt {
    return _selectMenuOpt;
  }
  //set para ejecutar codigo en especial

  set selectMenuOpt(int i) {
    _selectMenuOpt = i;
    notifyListeners();
    /*notifyListeners() :ayuda a notificar todos los widgets
     que se hizo un cambio en los datos y que nesesita que se redibujen*/
  }
}
