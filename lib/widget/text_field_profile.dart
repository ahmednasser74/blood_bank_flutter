import 'package:flutter/material.dart';

class TextFieldProfile extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final IconData icon;
  final TextInputType textInputType;
  final Function onTap;
  final bool obscureText;
  final int maxLines;

  TextFieldProfile(
      {this.textEditingController,
      this.labelText,
      this.icon,
      this.textInputType,
      this.onTap,
      this.obscureText,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: TextStyle(color: Colors.black),
      onTap: onTap,
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.red[900],
        ),
        hintText: labelText,
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding: EdgeInsets.all(20),
        hintStyle: TextStyle(color: Colors.red[900]),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
      ),
    );
  }
}
