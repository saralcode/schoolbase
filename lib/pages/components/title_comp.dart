import 'package:flutter/material.dart';

Widget title(String title) {
  return Center(
    child: Text(
      title,
      textScaleFactor: 2.5,
      style:  TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
          shadows: [
            BoxShadow(color: Colors.grey.shade400, blurRadius: 8, offset: const Offset(3, 3))
          ]),
      textAlign: TextAlign.center,
    ),
  );
}
