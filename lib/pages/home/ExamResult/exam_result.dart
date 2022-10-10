import 'package:flutter/material.dart';
import 'package:schoolbase/pages/components/title_comp.dart';

class ExamResult extends StatefulWidget {
  const ExamResult({Key? key}) : super(key: key);

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> {
  String selectedTerm = "term1";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        title("Exam Result"),
        const Divider(),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Term 1",
              textScaleFactor: 1.3,
            ),
            const SizedBox(
              width: 10,
            ),
            Radio(
                value: "term1",
                groupValue: selectedTerm,
                onChanged: (String? v) {
                  setState(() {
                    selectedTerm = v!;
                  });
                }),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Term 2",
              textScaleFactor: 1.3,
            ),
             const SizedBox(
              width: 10,
            ),
            Radio(
                value: "term2",
                groupValue: selectedTerm,
                onChanged: (String? v) {
                  setState(() {
                    selectedTerm = v!;
                  });
                }),
            
          ],
        )
      ],
    );
  }
}
