import 'package:flutter/material.dart';

class SnackBarCustom {
  dynamic content;
  double fontSize;
  TextAlign textAlign;
  Color backgroundColor;
  Duration? duration;

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();  

  SnackBarCustom({
    required this.content,
    this.fontSize = 16,
    this.textAlign  = TextAlign.start,
    this.backgroundColor = Colors.black,
    this.duration
  }){

    if(duration == null){
      duration = Duration(seconds: 5);
    }

    final snackBarControl = new SnackBar(
      content: (content is String) ? Text(content, style: (TextStyle(fontSize: fontSize)), textAlign: textAlign,) : content,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,      
      duration: duration!,      
    );

    SnackBarCustom.messengerKey.currentState!.showSnackBar(snackBarControl);
  }  
}



 