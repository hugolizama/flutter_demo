import 'package:flutter/material.dart';
export 'material_buttons.ui.dart';
export 'snackbar.ui.dart';
export 'input_decoration.ui.dart';

Color primaryColor =  Colors.blue;
Color secondaryColor = Colors.purple;
Color successColor = Colors.green;
Color errorColor = Color(0xFFf93154);
Color infoColor = Colors.lightBlue.shade300;
Color warningColor = Color(0xFFffa900);

double separacion = 10;


/* funcion para crear efecto de slide al pasar a otra pagina */
Route routeSlideTransition(dynamic page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(
        begin: begin, 
        end: end
      ).chain(
        CurveTween(curve: curve)
      );      

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );      
    },
  );
}


MaterialPageRoute routeMaterialTransition(dynamic page){
  return MaterialPageRoute(
    builder: (context) {
      return page;
    }
  );
}