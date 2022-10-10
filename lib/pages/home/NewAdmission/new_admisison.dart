import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schoolbase/pages/home/NewAdmission/components/address_info.dart';

class AdmissionItems {
  String label;

  AdmissionItems(
    this.label,
  );
}

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
  List<AdmissionItems> listItems = [
    AdmissionItems("Student Name"),
    AdmissionItems("Father's Name"),
    AdmissionItems("Mother's Name"),
    AdmissionItems("Occupation"),
    AdmissionItems("Mobile No"),
    AdmissionItems("Aadhar"),
  ];
  final dateController = TextEditingController();
  FocusNode focusNode = FocusNode();
  int gender = 0;
  bool sameAsPermanentAddress=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Admission"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const Text(
                  "Personal Info",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.indigo),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 1000
                          ? 4
                          : constraints.maxWidth > 600
                              ? 3
                              : constraints.maxWidth > 500
                                  ? 2
                                  : 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 0,
                      mainAxisExtent: 80),
                  children: [
                    ...listItems.map((admissionItem) => TextFormField(
                          decoration: InputDecoration(
                              // prefixIcon: Icon(admissionItem.icon),
                              hintText: admissionItem.label,
                              label: Text(admissionItem.label)),
                          onChanged: (value) {},
                        )),
                    TextFormField(
                        controller: dateController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          label: const Text("DOB"),
                          suffixIcon: IconButton(
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
                        )),
                  ],
                )),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Gender",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.indigo),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Male",
                        textScaleFactor: 1.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Radio(
                          value: 0,
                          groupValue: gender,
                          onChanged: (int? v) {
                            setState(() {
                              gender = v!;
                            });
                          }),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Female",
                        textScaleFactor: 1.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Radio(
                          value: 1,
                          groupValue: gender,
                          onChanged: (int? v) {
                            setState(() {
                              gender = v!;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Other",
                        textScaleFactor: 1.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Radio(
                          value: 2,
                          groupValue: gender,
                          onChanged: (int? v) {
                            setState(() {
                              gender = v!;
                            });
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Admission In",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.indigo),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 1000
                          ? 4
                          : constraints.maxWidth > 600
                              ? 3
                              : constraints.maxWidth > 500
                                  ? 2
                                  : 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 0,
                      mainAxisExtent: 80),
                  children: [
                    Autocomplete(
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
                    Autocomplete(
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
                  ],
                )),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Present Address",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.indigo),
                ),
                const SizedBox(
                  height: 20,
                ),
                const AddressInfo(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Permanent Address",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.indigo),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(value: sameAsPermanentAddress, onChanged: (bool ? v) {
                      setState(() {
                        sameAsPermanentAddress=v!;
                      });
                    }),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Same as Present Address",
                      textScaleFactor: 1.2,
                    ),
                  ],
                ), 
                const SizedBox(height: 20,), 
                const
                    AddressInfo()
              ],
            ));
      }),
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () {
              Get.snackbar("Saved", "Student Successfully saved!",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blue.shade500.withOpacity(0.8),
                  colorText: Colors.white);
            },
            child: const Text("Save"))
      ],
    );
  }
}
