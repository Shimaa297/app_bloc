
import 'package:flutter/material.dart';
import 'package:learn_app/constant.dart';

Widget defaultTextForm ({
  @required String  label,
   Widget suffixIcon,
   Widget prefixIcon,
  TextInputType textInputType,
  bool isPassword = false,
  Function suffixPressed,
  Function onSubmitted,
  @required Function validate,
  TextEditingController controller,
})
{
  return TextFormField(
      style: TextStyle(fontSize: 15.0, color: Colors.black),
      keyboardType: textInputType,
      onFieldSubmitted: onSubmitted,
      controller: controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon != null ? IconButton(icon: suffixIcon, onPressed: suffixPressed,  color: Colors.cyan,) : null,
      fillColor: Colors.white,
      labelText: label,
      labelStyle: TextStyle(color: defaultColor, fontSize: 16),
      contentPadding: const EdgeInsets.only(
          left: 14.0, bottom: 6.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyanAccent),
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.cyanAccent),
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
      validator: validate,
      obscureText: isPassword
  );
}