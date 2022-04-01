import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

import '../../ui/ui.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({ Key? key }) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _valorSlider = 100;
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {

    int imageWidth;
    Image image = new Image.network('https://i.pinimg.com/736x/56/0d/5f/560d5fef78acc6eec0e3c21b8c4b3e4f.jpg');
    Completer<ui.Image> completer = new Completer<ui.Image>();
    image.image
      .resolve(new ImageConfiguration())
      .addListener(ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);        
        imageWidth = info.image.width;
      }));

    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [      
              FutureBuilder<ui.Image>(
                future: completer.future,
                builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
                  if(snapshot.hasData){
                    // evita el error de tamaño al girar la pantalla
                    if (_valorSlider > MediaQuery.of(context).size.width) {                      
                        _valorSlider = MediaQuery.of(context).size.width;                     
                    } 

                    // controla el tamanio de la imagen
                    return Column(
                      children: [
                        SizedBox(height: 30,),

                        Slider(
                          label: 'Tamaño',
                          min: 10,
                          max: (MediaQuery.of(context).size.width < snapshot.data!.width.toDouble()) ? MediaQuery.of(context).size.width : snapshot.data!.width.toDouble(),
                          value: _valorSlider,
                          activeColor: secondaryColor,              
                          onChanged: _bloquearSlider == true ? null : ( valor ){
                            setState(() {                          
                              _valorSlider = valor;
                            });
                          },
                        ),


                        SizedBox(height: 30,),

                        SwitchListTile(
                          title: Text('Bloquear slider', 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: _bloquearSlider, 
                          onChanged: (val){
                            setState(() {
                              _bloquearSlider = val;
                            });
                          }
                        ),

                        SizedBox(height: 30,),
                             
                        Image(
                          image: image.image,
                          width: _valorSlider,
                          fit: BoxFit.contain,
                        )
                      ],
                    );
                  } else {
                    return new Text('Cargando...');
                  }
                },
              ),
      
              
      
            ],
          ),
        ),
      ),
    );
  }
}