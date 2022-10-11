import 'dart:typed_data';

import 'package:flutter/material.dart' as ma;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class FormItem {
  String label;
  double? maxWidth;
  String? innerText;
  TextAlign? textAlign;
  FormItem(this.label, {this.maxWidth, this.innerText, this.textAlign});
}

enum ForClass { eleven, below }

class NewAdmissionForm extends ma.StatefulWidget {
  final ForClass forClass;
  const NewAdmissionForm({ma.Key? key, required this.forClass})
      : super(key: key);

  @override
  ma.State<NewAdmissionForm> createState() => _NewAdmissionFormState();
}

class _NewAdmissionFormState extends ma.State<NewAdmissionForm> {
  @override
  ma.Widget build(ma.BuildContext context) {
    return ma.Scaffold(
      appBar: ma.AppBar(
          title: ma.Text(
              "Admission Form ${widget.forClass == ForClass.eleven ? 'XI' : ''}")),
      body: PdfPreview(
        canDebug: false,
        canChangePageFormat: true,
        initialPageFormat: PdfPageFormat.a4,
        pageFormats: const {"A4": PdfPageFormat.a4},
        build: (format) => _generatePdf(format, widget.forClass),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, ForClass forClass) async {
    final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
    // final font = await PdfGoogleFonts.nunitoExtraLight();
    List<FormItem> listItems = [
      FormItem("Student Name", maxWidth: 0.4),
      // FormItem("Admission In", innerText: "Class: ", maxWidth: 0.2),
      FormItem("Aadhar", maxWidth: 0.18),
      FormItem("DOB (DD/MM/YYYY)", maxWidth: 0.17),
      FormItem(
        "Gender",
        maxWidth: 0.28,
        innerText: "(Male / Female / Other) : ",
      ),
      FormItem("Identification Mark (If Any)", maxWidth: 0.30),
      FormItem("Mother Tongue", maxWidth: 0.17),
      
      FormItem("Category",
          innerText: "(General / OBC / SC / ST) : ", maxWidth: 0.27),
      FormItem("Caste", maxWidth: 0.15),
      FormItem("Religion", maxWidth: 0.15),
      FormItem("Nationality", maxWidth: 0.17),
    ];
    
    List<FormItem> parentItems = [
      FormItem("Father's Name", maxWidth: 0.4),
      FormItem("Mobile/Telephone", maxWidth: 0.15),
      FormItem("Aadhar", maxWidth: 0.17),
      FormItem("Father Occupation", maxWidth: 0.18),
      FormItem("Mother's Name", maxWidth: 0.4),
      FormItem("Mobile/Telephone", maxWidth: 0.15),
      FormItem("Aadhar", maxWidth: 0.17),
      FormItem("Mother Occupation", maxWidth: 0.18),
      FormItem("Guardian's Name", maxWidth: 0.4),
      FormItem("Mobile/Telephone", maxWidth: 0.15),
      FormItem("Aadhar", maxWidth: 0.17),
      FormItem("Relation with Guardian", maxWidth: 0.18),
      FormItem("Father Qualification", maxWidth: 0.30),
      FormItem("Mother Qualification", maxWidth: 0.30),
      FormItem("Email Address", maxWidth: 0.30),
    ];
    List<FormItem> addressDetail = [
      FormItem("Present Address", maxWidth: 0.38),
      FormItem("City / District", maxWidth: 0.2),
      FormItem("State / Province", maxWidth: 0.2),
      FormItem("PIN Code", maxWidth: 0.12),
      FormItem("Permanent Address", maxWidth: 0.38),
      FormItem("City / District", maxWidth: 0.2),
      FormItem("State / Province", maxWidth: 0.2),
      FormItem("PIN Code", maxWidth: 0.12),
    ];
    List<FormItem> bankDetails = [
      FormItem("Account No.", maxWidth:0.28),
      FormItem("Bank Name", maxWidth: 0.37),
      FormItem("IFSC"),
    ];
    final netImage = await networkImage('https://www.ssvmptps.in/favicon.ico');
    pdf.addPage(
      Page(
        clip: true,
        margin: const EdgeInsets.all(15),
        pageFormat: format,
        orientation: PageOrientation.portrait,
        build: (context) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Stack(children: [
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Image(netImage, height: 70, width: 70))),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Opacity(
                            opacity: 0.15,
                            child: Image(netImage, height: 300, width: 300)))),
                Expanded(
                    child: ListView(children: [
                  Center(
                    child: Text("Saraswati Shishu Vidya Mandir",
                        textScaleFactor: 1.4,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 2),
                  Center(
                    child: Text(
                      "Patratu Thermal, Ramgarh Jharkhand - 829119",
                      textScaleFactor: 0.75,
                    ),
                  ),
                  SizedBox(height: 2),
                  Center(
                    child: Text(
                      "Affliated with CBSE, New Delhi (3430234)",
                      textScaleFactor: 0.75,
                    ),
                  ),
                  SizedBox(height: 3),
                  Center(
                      child: Text(
                    "School Code: 66428",
                    textScaleFactor: 0.75,
                  )),
                  SizedBox(height: 3),
                  Center(
                      child: Text(
                    "Managed by - Vidya Vikash Samiti, Jharkhand, Regd No - 1082/94-95",
                    textScaleFactor: 0.75,
                  )),
                  SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Stack(children: [
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("UDISE: 20241308011", textScaleFactor: 0.7),
                              Text("website : www.ssvmptps.in",
                                  textScaleFactor: 0.7),
                            ]),
                      )),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            decoration: BoxDecoration(
                                color: PdfColors.black,
                                borderRadius: BorderRadius.circular(2)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Text("ADMISSION FORM",
                                style: TextStyle(
                                    color: PdfColors.white,
                                    fontWeight: FontWeight.bold))),
                      )),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Phone:  8247474245",
                                        textScaleFactor: 0.7),
                                    Text("Email: ssvm2010@rediffmail.com ",
                                        textScaleFactor: 0.7)
                                  ])))
                    ]),
                  ),
                  SizedBox(height: 1),
                  Divider(height: 0.5),
                  Divider(height: 4),
                  SizedBox(height: 2),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Form No: 224",
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Date : 10/09/2022",
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Session : 2022-2023",
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                  Divider(height: 4),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "I request to admit my son / daughter / ward in STD __________________ ${forClass == ForClass.eleven ? 'with Stream __________________' : ''} in your school.\nThe details are given below: -",
                        textScaleFactor: 0.8,
                        style: const TextStyle(lineSpacing: 5)),
                  ),
                  SizedBox(height: 10),
                  Container(
                      width: double.infinity,
                      child: Row(children: [
                        Expanded(
                          child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runSpacing: 5,
                              children: [
                                ...listItems.map((e) => buildField(e, format))
                              ]),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 90,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text(
                                "Paste here your passport size color photograph",
                                textScaleFactor: 0.7,
                                textAlign: TextAlign.center)),
                      ])),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Parent Details",
                        textScaleFactor: 0.7,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Divider(height: 9),

                  Container(
                      width: double.infinity,
                      child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          
                          runSpacing: 5,
                          children: [
                            ...parentItems.map((e) => buildField(e, format))
                          ])),
                  SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Address Details",
                        textScaleFactor: 0.7,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Divider(height: 9),
                  Container(
                      width: double.infinity,
                      child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runSpacing: 5,
                          children: [
                            ...addressDetail.map((e) => buildField(e, format))
                          ])),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Bank Details",
                        textScaleFactor: 0.7,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Divider(height: 9),
                  Container(
                      width: double.infinity,
                      child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          
                          runSpacing: 5,
                          children: [
                            ...bankDetails.map((e) => buildField(e, format))
                          ])),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Required Documents",
                        textScaleFactor: 0.7,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Divider(height: 6),
                  SizedBox(height: 2),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("1. Birth Certificate", textScaleFactor: 0.7),
                        Text("2. School Leaving Certificate",
                            textScaleFactor: 0.7),
                        Text("2. Marksheet of Last Examination",
                            textScaleFactor: 0.7),
                        Text("4. Aadhar", textScaleFactor: 0.7),
                      ]),
                  SizedBox(height: 8),
                  Divider(height: 0.5),
                  Divider(height: 3),
                  SizedBox(height: 4),
                  Text("DECLARATION",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                  SizedBox(height: 2),
                  Text(
                      "I agree to abide by the rules and regulations of the institution, if any information furnished by me proved to be false or if my ward founds guilty of violating the discipline / norms of the institution, the candidature on my ward may be cancelled at any stage and I shall not be entitled to get back of any fee paid to the school.",
                      textScaleFactor: 0.7),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Student's Signature", textScaleFactor: 0.8),
                        Text("Parent's Signature", textScaleFactor: 0.8),
                      ]),
                  SizedBox(height: 5),
                  Divider(height: 0.5),
                  Divider(height: 3),
                  SizedBox(height: 4),
                  Text("FOR OFFICE USE ONLY",
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                  SizedBox(height: 2),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Admission No. __________________",
                            textScaleFactor: 0.7),
                        Text("Date of Admission: __________________",
                            textScaleFactor: 0.7)
                      ]),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "The Child is Selected and May be admitted in Class __________________ Section __________________ ",
                          textScaleFactor: 0.7)),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Exam Controller", textScaleFactor: 0.8),
                              Text("Principal Signature", textScaleFactor: 0.8),
                            ])
                      ])),
                ]))
              ]));
        },
      ),
    );

    return pdf.save();
  }
}

Widget buildField(FormItem e, PdfPageFormat format) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: e.maxWidth != null ? format.width * e.maxWidth! : 150,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(e.label, textScaleFactor: 0.7, textAlign: TextAlign.left),
        )),
    SizedBox(height: 2),
    Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      constraints: BoxConstraints(
          maxWidth: e.maxWidth != null ? format.width * e.maxWidth! : 150,
          minWidth: 50,
          minHeight: 14),
      child: SizedBox(
          width: e.maxWidth != null ? format.width * e.maxWidth! : 150,
          child: Text(e.innerText ?? "",
              textScaleFactor: 0.7, textAlign: e.textAlign ?? TextAlign.left)),
    )
  ]);
}
