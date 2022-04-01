import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../ui/ui.dart';
import '../services/services.dart';

class InternetScreen extends StatefulWidget {  

  @override
  _InternetScreenState createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {

  late StreamSubscription _connectionChangeStream; //inicializar el stream
  ConnectionStatus connectionStatus = ConnectionStatus.getInstance(); //obtener instancia de la clase    

  @override
  void initState(){
    super.initState();   

    // iniciar el test de conexion
    connectionStatus.initialize();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged); //subscripcion al stream de cambio de estados       
  }

  // funcion para establecer el estado de la conexion
  void connectionChanged(dynamic hasConnection){
    setState(() {
      if(!hasConnection){
        SnackBarCustom(
          content: 'Sin conexión a internet',
        );
      }      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificación de Internet'),        
      ),
      drawer: SideMenuWidget(),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Text('Desactivar y activar el modo avion para ejecutar la verificación de internet.', style: (TextStyle(fontSize: 20)),)
      ),
    );
  }
}

