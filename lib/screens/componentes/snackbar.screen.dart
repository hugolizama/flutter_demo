import 'package:flutter/material.dart';

import '../../ui/ui.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones SnackBar'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 40, right: 40),
        alignment: Alignment.center,
        child: Column(
          children: [
            MaterialButtonCustom(
              text: 'Mostrar Snackbar', 
              size: 'lg',
              type: 'success',
              width: double.infinity,
              onPressed: (){
                SnackBarCustom(
                  content: 'Prueba de SnackBar',
                  textAlign: TextAlign.center,
                  fontSize: 26,
                  backgroundColor: errorColor
                );
              }
            )
          ],
        ),
      ),
    );
  }
}