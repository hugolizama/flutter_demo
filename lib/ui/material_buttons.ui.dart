import 'package:flutter/material.dart';
import 'ui.dart';

class MaterialButtonCustom extends StatelessWidget{

  final dynamic text;
  final String? type;
  final double? width;
  final String? size;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onPressed;

  Color backgroundColor = Colors.black;
  double paddingVerfical = 10;
  double paddingHorizontal = 15;
  double fontSizeButton = 20;
  

  MaterialButtonCustom({
    required this.text,
    required this.onPressed,
    this.type = 'primary',
    this.width,
    this.size = 'md',
    this.textColor = Colors.white,    
    this.fontSize
  }) {    

    switch (type) {
      case 'primary':
        this.backgroundColor = primaryColor;
        break;
      case 'secondary':
        this.backgroundColor = secondaryColor;
        break;
      case 'success':
        this.backgroundColor = successColor;
        break;
      case 'error':
        this.backgroundColor = errorColor;
        break;
      case 'info':
        this.backgroundColor = infoColor;
        break;
      case 'warning':
        this.backgroundColor = warningColor;
        break;
      default:
    }    
    
    switch (size) {
      case 'xs':
        paddingVerfical = 6;
        paddingHorizontal = 10;
        fontSizeButton = 15;
        break;
      case 'sm':
        paddingVerfical = 8;
        paddingHorizontal = 12;
        fontSizeButton = 18;
        break;
      case 'md':
        paddingVerfical = 10;
        paddingHorizontal = 15;
        fontSizeButton = 20;
        break;
      case 'lg':
        paddingVerfical = 12;
        paddingHorizontal = 20;
        fontSizeButton = 24;
        break;
       case 'xl':
        paddingVerfical = 20;
        paddingHorizontal = 30;
        fontSizeButton = 26;
        break;
      default:

        break;
    }    

    if(fontSize != null){
      fontSizeButton = fontSize!;
    }
  }

 

  @override
  Widget build(BuildContext context) {
    /*return MaterialButton(
      child: Container(
        width: (width != null) ? width : double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVerfical),
        child: (text is Widget) ? text : Text(
          text,
          style: TextStyle(
            color: (textColor != null) ? textColor : Colors.white, 
            fontSizeButton: fontSizeButton
          ),
        ),
      ),
      color: color,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      disabledElevation: 10,
      onPressed: onPressed
    );*/


    return Container(
      width: (width == null) ? null : width,
      child: ElevatedButton (
        onPressed: onPressed, 
        child: (text is Widget) ? text : Text(text),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> state) {
              if(state.contains(MaterialState.disabled)){
                return Colors.grey.shade700;
              }

              return textColor!;
            }
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> state) {
              if(state.contains(MaterialState.disabled)){
                return Colors.grey;
              }

              return backgroundColor;
            }
          ),          
          elevation: MaterialStateProperty.all<double>(10),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),   
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVerfical)),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
            fontSize: fontSizeButton
          )),                            
        ),
      ),
    );
  }

}