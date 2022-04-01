/**
 * Prueba encontrada en StakOverflow
 * https://stackoverflow.com/a/53855326/3108950
 * 
 * No actualiza estado al desconectar la red wifi del disposivo
 */

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';


class ConexionInternetService {
  static bool hasConnection = true;  
}




class ConnectionStatus {

  // establece una instancia única de la clase
  static final ConnectionStatus _singleton = new ConnectionStatus._internal();
  ConnectionStatus._internal();

  // getter utilizado para obtener la instancia
  static ConnectionStatus getInstance() => _singleton;

  // establece el estado de la conexion
  //bool hasConnection = true;

  // stream para permitir la subscripcion a los cambios de estados
  StreamController connectionChangeController = new StreamController.broadcast();

  // propiedad de conectividad
  final Connectivity _connectivity = Connectivity();

  // se realiza la prueba de conexion desde el inicio
  // se establece el enlace hacia el stream para escuchar los cambios de conexion
  void initialize(){
    checkConnection();
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }
  Stream get connectionChange => connectionChangeController.stream;

  // cerrar el stream 
  void dispose(){
    connectionChangeController.close();
  }

  // listener del cambio de conexion
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  // funcion para realizar el test de conexion
  Future<bool> checkConnection() async {
    //print('checkConnection');
    //bool previousConnection = hasConnection;
    bool previousConnection = ConexionInternetService.hasConnection;
    dynamic result = '';

    // realizar un retraso de 2 segundos antes de hacer la prueba
    return Future.delayed(Duration(seconds: 2), () async {
      try{
        result = await InternetAddress.lookup('google.com'); //prueba de conexion hacia google.com
        //print(result.toString());
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          //hasConnection = true;
          ConexionInternetService.hasConnection = true;
          //print('checkConnection - checkConnection: true');
        } else {
          //hasConnection = false;
          ConexionInternetService.hasConnection = false;
          //print('checkConnection - checkConnection: false');
        }

      } on SocketException catch( _ ){
        //hasConnection = false;
        ConexionInternetService.hasConnection = false;
        //print('checkConnection - checkConnection: false (error)');
      }

      if(/*previousConnection != hasConnection*/ previousConnection != ConexionInternetService.hasConnection){
        //connectionChangeController.add(hasConnection);
        connectionChangeController.add(ConexionInternetService.hasConnection);
      }

      //print('return hasConnection');
      //return hasConnection; // regresa el estado de la conexion
      //print('return has connection - ' + ConexionInternetService.hasConnection.toString());
      return ConexionInternetService.hasConnection; // regresa el estado de la conexion
    });



  }
}