import 'package:flutter/material.dart';

Widget defaultButton({
  @required String text,
  IconData icon,
  @required Function function,
  Color background = Colors.cyan,
  double width = double.infinity,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: MaterialButton(
      onPressed: function,
      elevation: 30.0,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

void navigateTo(context, widget) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => widget
        )
    );

void navigateRemove(context , widget) =>
    Navigator.pushAndRemoveUntil(context, widget, (route) => false);