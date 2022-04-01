import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(
          //color: miTema.accentColor,
          strokeWidth: 10,               
        )
      ),
    );
  }
}