import 'package:flutter/material.dart';
import 'constants.dart';

class TextFieldRegister extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final IconData icon;
  final TextInputType textInputType;
  final Function onTap;
  final bool obscureText;

  TextFieldRegister(
      {this.textEditingController,
      this.labelText,
      this.icon,
      this.textInputType,
      this.onTap,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      onTap: onTap,
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: kDecorationLoginTextField.copyWith(
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          )),
    );
  }
}
