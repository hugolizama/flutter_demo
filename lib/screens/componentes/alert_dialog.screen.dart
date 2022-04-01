import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/alert_dialog.widget.dart';

import '../../ui/ui.dart';

class AlertDialogScreen extends StatelessWidget {  
  
  const AlertDialogScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),        
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 40, right: 40),
        alignment: Alignment.center,
        child: Column(
          children: [
            MaterialButtonCustom(
              text: 'Mostrar dialogo', 
              size: 'xl',
              type: 'success',
              width: double.infinity,
              onPressed: (){
                AlertDialogCustom(
                  context: context, 
                  title: Text('Titulo del dialog'),
                  body: Text('Contenido del dialog'),
                  actions: [     
                    MaterialButtonCustom (
                      text: Text('Cancelar'), 
                      size: 'sm',
                      type: 'error',
                      onPressed: (){
                        Navigator.of(context).pop();
                      }
                    ),

                    MaterialButtonCustom (
                      text: Text('Aceptar'), 
                      size: 'sm',                      
                      onPressed: null
                    ),                    
                  ]                  
                );
              }
            )
          ],
        ),
      )
    );
  }
}