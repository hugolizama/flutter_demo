import 'package:flutter/material.dart';

class EncriptarFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _textoEncriptar = '';
  String _textoEncriptado = '';
  String _textoDesencriptado = '';


  String get textoEncriptar => _textoEncriptar;
  set textoEncriptar(String valor){
    _textoEncriptar = valor;
    notifyListeners();
  }

  String get textoEncriptado => _textoEncriptado;
  set textoEncriptado(String valor){
    _textoEncriptado = valor;
    notifyListeners();
  }

  String get textoDesencriptado => _textoDesencriptado;
  set textoDesencriptado(String valor){
    _textoDesencriptado = valor;
    notifyListeners();
  }


  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }
}