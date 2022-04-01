import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
        actions: [
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/2d/46/b7/2d46b7328b3f234c70a150430270a44e.jpg'),
            ),
            margin: EdgeInsets.only(right: 10),
          ),


          Container(
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown[200],
              foregroundColor: Colors.white,
              
            ),
            margin: EdgeInsets.only(right: 10),
          )
        ],
      ),

      body: Container(
        margin: EdgeInsets.all(40),
        child: Text('Ejemplo de avatar en donde podría aparecer el menu de usuarios, con una imagen o solo iniciales', style: TextStyle(fontSize: 24),)
      ),
    );
  }
}