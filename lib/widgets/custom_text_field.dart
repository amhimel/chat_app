import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,  this.keyboardType,  this.decoration, required this.obscureText, this.validator, this.onSave});
  final TextInputType? keyboardType ;
  final InputDecoration? decoration;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onSave;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: decoration,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      onSaved: onSave,

    );
  }
}
