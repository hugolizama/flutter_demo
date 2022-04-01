import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/ui/ui.dart';
import '/widgets/widgets.dart';

class EncriptarScreen extends StatefulWidget {
  @override
  _EncriptarScreenState createState() => _EncriptarScreenState();
}

class _EncriptarScreenState extends State<EncriptarScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Encriptar'),
      ),
      drawer: SideMenuWidget(),
      body: ChangeNotifierProvider(
        create: (_) => EncriptarFormProvider(),
        child: _EncriptarForm(),
      ),
    );
  }
}



class _EncriptarForm extends StatefulWidget {
  @override
  __EncriptarFormState createState() => __EncriptarFormState();
}

class __EncriptarFormState extends State<_EncriptarForm> {
  late TextEditingController _tec;

  @override
  void dispose() {
    // TODO: implement dispose
    _tec.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final encriptarForm = Provider.of<EncriptarFormProvider>(context);    //provider del formulario
    final key = encrypt.Key.fromUtf8(dotenv.env['encriptar_llave'].toString());
    final iv = encrypt.IV.fromLength(16); 
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    _tec = new TextEditingController(
      text: encriptarForm.textoEncriptado      
    )..selection = TextSelection.collapsed(
      offset: encriptarForm.textoEncriptado.length
    );

    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: encriptarForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction, // validar formulario a la iteraccion del usuario
        child: Column(
          children: [
            TextFormField(
              key: Key('texto a encriptar'),
              decoration: InputDecorationCustom.textField(labelText: 'Texto a encriptar', hintText: 'Ingrese una cadena de texto'),
              onChanged: (valor) => encriptarForm.textoEncriptar = valor, 
            ),

            SizedBox(height: separacion,),

            MaterialButtonCustom(
              text: 'Encriptar', 
              width: double.infinity,
              size: 'lg',
              onPressed: (){  
                encriptarForm.textoEncriptado = encrypter.encrypt(encriptarForm.textoEncriptar, iv: iv).base64;                
              }
            ),

            Divider(
              color: Colors.black,
              height: 50,
            ),

            TextFormField(
              key: Key('texto encriptado'), 
              controller: _tec,
              decoration: InputDecorationCustom.textField(labelText: 'Texto a encriptado', hintText: 'Cadena que resulta del encriptado'),    
            ),

            SizedBox(height: separacion,),

            MaterialButtonCustom(
              text: 'Desencriptar', 
              width: double.infinity,
              size: 'lg',
              type: 'success',
              onPressed: (){
                encriptarForm.textoEncriptado = _tec.text;

                try {
                  encriptarForm.textoDesencriptado = encrypter.decrypt(encrypt.Encrypted.fromBase64(encriptarForm.textoEncriptado), iv: iv);
                } catch (e) {
                  encriptarForm.textoDesencriptado = '';
                }
              }
            ),

            SizedBox(height: 25,),

            encriptarForm.textoDesencriptado != '' ? Text('Texto original: ' + encriptarForm.textoDesencriptado, style: TextStyle(fontSize: 18),) : Container(),

          ],
        ),
      ),
    );
  }
}