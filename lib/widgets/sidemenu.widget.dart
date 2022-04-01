import 'package:flutter/material.dart';

import '../../ui/ui.dart';
import '../screens/screens.dart';

class SideMenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(      
      child: ListView(       
        children: [
          ListTile(
            leading: Icon(Icons.wifi_outlined, color: primaryColor,),
            title: Text('Verificar Internet'),
            onTap: (){
              Navigator.pushReplacement(context, routeSlideTransition(InternetScreen()));
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.grid_view_outlined, color: primaryColor,),
            title: Text('Componentes'),
            onTap: (){
              Navigator.pushReplacement(context, routeSlideTransition(ComponentesScreen()));
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.enhanced_encryption_outlined, color: primaryColor,),
            title: Text('Encriptar'),
            onTap: (){
              Navigator.pushReplacement(context, routeSlideTransition(EncriptarScreen()));
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.photo_camera_outlined, color: primaryColor,),
            title: Text('Cámara'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.email_outlined, color: primaryColor,),
            title: Text('Enviar Correo'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.settings_outlined, color: primaryColor,),
            title: Text('Diagnostics'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),
          
          ListTile(
            leading: Icon(Icons.record_voice_over_outlined, color: primaryColor,),
            title: Text('Texto a voz'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.fingerprint_outlined, color: primaryColor,),
            title: Text('Reconocimiento de huella'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.sim_card_outlined, color: primaryColor,),
            title: Text('Tarjeta Sim'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.qr_code_scanner_outlined, color: primaryColor,),
            title: Text('Escaneo código de barras'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),

          ListTile(
            leading: Icon(Icons.my_location_outlined, color: primaryColor,),
            title: Text('Geolocation'),
            onTap: (){
              //Navigator.pushNamed(context, 'login');
            },
          ),
          divider(),
        ],
      ),
    );
  }

  Divider divider() => Divider(height: 0, thickness: 1, indent: 10, endIndent: 10,);
}