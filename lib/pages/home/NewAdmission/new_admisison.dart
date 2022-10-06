import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class AdmissionItems {
  String label;
  IconData icon;
  AdmissionItems(this.label, this.icon);
}

List<AdmissionItems> listItems = [
  AdmissionItems("Name", Icons.person),
  AdmissionItems("Father's Name", Icons.person),
  AdmissionItems("Mother's Name", Icons.person),
  AdmissionItems("Aadhar", Icons.person),
];

List<String> items = [
  'UKG',
  'LKG',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
];

List<String> section = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];

class NewAdmission extends StatefulWidget {
  const NewAdmission({Key? key}) : super(key: key);

  @override
  State<NewAdmission> createState() => _NewAdmissionState();
}

class _NewAdmissionState extends State<NewAdmission> {
  final dateController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Center(
          child: Text(
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
        ),
        Expanded(
          child: FocusTraversalGroup(
              child: LayoutBuilder(builder: (context, constraints) {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth > 1000
                      ? 4
                      : constraints.maxWidth > 600
                          ? 3
                          : constraints.maxWidth > 500
                              ? 2
                              : 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 80),
              children: [
                ...listItems.map((admissionItem) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        // controller: controller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(admissionItem.icon),
                            hintText: admissionItem.label,
                            label: Text(admissionItem.label)),
                        onChanged: (value) {},
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: dateController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          label: const Text("DOB"),
                          prefixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context, //context of current state
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        1980), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime.now());

                                if (pickedDate != null) {
                           
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    dateController.text = formattedDate;
                                  });
                                } else {
                                  log("Date is not selected");
                                }
                              },
                              splashRadius: 25,
                              icon: const Icon(Icons.date_range)),
                        ))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Autocomplete(
                      fieldViewBuilder: (context, textEditingController,
                          focusNode, onFieldSubmitted) {
                        this.focusNode = focusNode;
                        return TextFormField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onEditingComplete: onFieldSubmitted,
                          decoration: const InputDecoration(
                              hintText: "Class",
                              label: Text("Class"),
                              prefixIcon: Icon(Icons.class_)),
                        );
                      },
                      optionsBuilder: (textEditingValue) {
                        return items.where((element) => element
                            .contains(textEditingValue.text.toUpperCase()));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Autocomplete(
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onEditingComplete: onFieldSubmitted,
                        decoration: const InputDecoration(
                            hintText: "Section",
                            label: Text("Section"),
                            prefixIcon: Icon(Icons.class_)),
                      );
                    },
                    optionsBuilder: (textEditingValue) {
                      return section.where((element) => element
                          .contains(textEditingValue.text.toUpperCase()));
                    },
                  ),
                ),
              ],
            );
          })),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Get.dialog(const Dialog(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Successfully Saved"),
                ),
              ));
            },
            child: const Text("Save"))
      ],
    );
  }
}
