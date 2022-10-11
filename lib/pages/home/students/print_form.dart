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
      appBar: ma.AppBar(title: ma.Text("Admission Form ${widget.forClass==ForClass.eleven?'XI':''}")),
      body: PdfPreview(
        canDebug: false,
        build: (format) => _generatePdf(format, widget.forClass),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, ForClass forClass) async {
    final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
    // final font = await PdfGoogleFonts.nunitoExtraLight();
    List<FormItem> listItems = [
      FormItem("Student Name", maxWidth: 220),
      FormItem("Admission In", innerText: "Class: " ),
      FormItem("Gender",
          maxWidth: 220, innerText: "(Male / Female / Other) : ",),
      FormItem("Aadhar"),
      FormItem("DOB (DD/MM/YYYY)"),
    ];
    if (forClass == ForClass.eleven) {
      listItems.insert(
        2,
        FormItem("Stream", innerText: " Science / Commerce"),
      );
    }
    List<FormItem> parentItems = [
      FormItem("Father's Name", maxWidth: 220),
      FormItem("Mobile/Telephone"),
      FormItem("Aadhar"),
      FormItem("Mother's Name", maxWidth: 220),
      FormItem("Mobile/Telephone"),
      FormItem("Aadhar"),
      FormItem("Guardian's Name", maxWidth: 220),
      FormItem("Mobile/Telephone"),
      FormItem(
        "Relation with Guardian",
      ),
      FormItem("Category",
          innerText: "(General / OBC / SC / ST) : ", maxWidth: 220),
      FormItem(
        "Father Occupation",
      ),
      FormItem(
        "Mother Occupation",
      ),
    ];
    List<FormItem> addressDetail = [
      FormItem("Address", maxWidth: 348),
      FormItem("City / District"),
      FormItem("State / Province"),
      FormItem("Country"),
      FormItem("PIN Code"),
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
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: ListView(children: [
                SizedBox(
                  height: 50,
                  child: Stack(children: [
                    Positioned.fill(
                        left: 0,
                        top: 0,
                        child: Image(netImage, height: 50, width: 50)),
                    Positioned.fill(
                        child: Column(children: [
                      Center(
                        child: Text("Saraswati Shishu Vidya Mandir",
                            textScaleFactor: 1.4,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 2),
                      Center(
                        child: Text("Affliated with CBSE, New Delhi (3430234)",
                            textScaleFactor: 0.75,
                            ),
                      ),
                      SizedBox(height: 3),
                      Center(
                        child: Text("Patratu Thermal",
                            textScaleFactor: 1,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            )),
                      ),
                    ]))
                  ]),
                ),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("website: www.ssvmptps.in"),
                      Text("Phone:  8247474245"),
                    ]),
                SizedBox(height: 1),
                Divider(height: 0.5),
                Divider(height: 4),
                SizedBox(height: 10),
                Container(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10,
                        runSpacing: 5,
                        children: [...listItems.map((e) => buildField(e))])),
                SizedBox(height:15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Parent Details", style: TextStyle(fontWeight: FontWeight.bold) ),
                ),
                Divider(),
                SizedBox(height: 5),
                Container(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10,
                        runSpacing: 5,
                        children: [...parentItems.map((e) => buildField(e))])),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Present Address",  style: TextStyle(fontWeight: FontWeight.bold) ),
                ),
                Divider(),
                Container(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10,
                        runSpacing: 5,
                        children: [
                          ...addressDetail.map((e) => buildField(e))
                        ])),
                SizedBox(height:15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Permanent Address",
                      style: TextStyle(fontWeight: FontWeight.bold) ),
                ),
                Divider(),
                Container(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10,
                        runSpacing: 5,
                        children: [
                          ...addressDetail.map((e) => buildField(e))
                        ])),

                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ 
                              Text("Student Signature"), 
                              Text("Principle Signature"), 
                            ])
                        ]) ) 
              ]));

        },
      ),
    );

    return pdf.save();
  }
}

Widget buildField(FormItem e) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: e.maxWidth ?? 150,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(e.label, textAlign: TextAlign.left),
        )),
    SizedBox(height: 2),
    Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(border: Border.all(width: 1)),
      constraints: BoxConstraints(
          maxWidth: e.maxWidth ?? 150, minWidth: 50, minHeight: 18),
      child: SizedBox(
        width: e.maxWidth??150,
        child: Text(e.innerText ?? "", textAlign: e.textAlign?? TextAlign.left )),
    )
  ]);
}
