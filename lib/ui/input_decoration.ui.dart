import 'package:flutter/material.dart';


class InputDecorationCustom {

  static InputDecoration textField ({
    required String labelText,
    required String hintText,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      alignLabelWithHint: true,
      hintText: hintText,
      suffixIcon: (suffixIcon != null) ? Icon(suffixIcon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      counter: null,
      counterText: '',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      
    );
  }

}