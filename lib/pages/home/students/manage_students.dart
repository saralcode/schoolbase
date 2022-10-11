import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolbase/pages/components/title_comp.dart';
import 'package:schoolbase/pages/home/NewAdmission/new_admisison.dart';
import 'package:schoolbase/pages/home/students/print_form.dart';

class ManageStudents extends StatefulWidget {
  const ManageStudents({Key? key}) : super(key: key);

  @override
  State<ManageStudents> createState() => _ManageStudentsState();
}

class NavButtons {
  String text;
  IconData icon;
  Widget page;
  Color color;
  NavButtons(this.text, this.icon, this.page, this.color);
}

List<NavButtons> items = [
  NavButtons(
      "New Admission", Icons.person_add, const NewAdmission(), Colors.blue),
  NavButtons("Update Student", Icons.edit, const NewAdmission(), Colors.orange),
  NavButtons("Delete Student", Icons.delete, const NewAdmission(), Colors.pink)
];

class _ManageStudentsState extends State<ManageStudents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title("Manage Students"),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    ...items
                        .map(
                          (e) => ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(e.color),
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(300, 80)),
                                  textStyle: const MaterialStatePropertyAll(
                                      TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              onPressed: () {
                                Get.to(e.page);
                              },
                              icon: Icon(e.icon),
                              label: Text(e.text)),
                        )
                        .toList(),
                    ElevatedButton.icon(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.indigo),
                            fixedSize: MaterialStatePropertyAll(Size(300, 80)),
                            textStyle: MaterialStatePropertyAll(TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                        onPressed: () {
                          Get.to(() => const NewAdmissionForm(forClass: ForClass.below));
                        },
                        icon: const Icon(Icons.print),
                        label: const Text("Admission Form")), 
                        ElevatedButton.icon(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.deepOrange),
                            fixedSize: MaterialStatePropertyAll(Size(300, 80)),
                            textStyle: MaterialStatePropertyAll(TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                        onPressed: () {
                          Get.to(() =>
                              const NewAdmissionForm(forClass: ForClass.eleven));
                        },
                        icon: const Icon(Icons.print),
                        label: const Text("Class 11 Form"))
                  ]);
            },
          ),
        ),
      ],
    );
  }
}
