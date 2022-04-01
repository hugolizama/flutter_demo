import 'package:flutter/material.dart';

class AlertDialogCustom {

  final BuildContext context;
  final dynamic title;
  final Widget body;
  final List<Widget>? actions;

  AlertDialogCustom({ required this.context, required this.body, this.title,  this.actions }){
    showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: (title == null) ? null : 
                      (title is Widget) ? title : Text(title),
              content: body,
              actions: actions,
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context, 
      pageBuilder: (context, anim1, anim2) {
        return Container();
      },
    );
  } 

}