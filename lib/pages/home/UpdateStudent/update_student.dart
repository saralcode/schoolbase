import 'package:flutter/material.dart';

class UpdateStudent extends StatelessWidget {
  const UpdateStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        Text(
          "Update Student",
          textScaleFactor: 2.5,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pink,
              shadows: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5, offset: Offset(3, 3))
              ]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
