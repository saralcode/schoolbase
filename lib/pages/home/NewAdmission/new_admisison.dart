import 'package:flutter/material.dart';

class NewAdmission extends StatelessWidget {
  const NewAdmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        Text(
          "New Admission",
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
