import 'dart:typed_data';

import 'package:flutter/material.dart' as ma;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:schoolbase/pages/home/NewAdmission/new_admisison.dart';

List<AdmissionItems> listItems = [
  AdmissionItems("Student Name"),
  AdmissionItems("Father's Name"),
  AdmissionItems("Mother's Name"),
  AdmissionItems("Occupation"),
  AdmissionItems("Mobile No"),
  AdmissionItems("Aadhar"),
];

class PrintIt extends ma.StatelessWidget {
  const PrintIt({ma.Key? key}) : super(key: key);

  @override
  ma.Widget build(ma.BuildContext context) {
    return ma.Scaffold(
      appBar: ma.AppBar(title: const ma.Text("Print Admission Form")),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
    // final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      Page(
        clip: true,
        margin: const EdgeInsets.all(15),
        pageFormat: format,
        build: (context) {
          return Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: ListView(children: [
                Center(
                  child: Text("Saraswati Shishu Vidya Mandir",
                      textScaleFactor: 1.4,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text("Patratu Thermal",
                      textScaleFactor: 1,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                      )),
                ),
                SizedBox(height: 20),
                Divider(height: 0.5),
                Divider(height: 4),
                SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ...listItems.map((e) => Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ConstrainedBox(
                                      constraints:
                                          const BoxConstraints(maxWidth: 150),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(e.label,
                                              textAlign: TextAlign.left),
                                        )
                                    ),
                                    SizedBox(height: 2),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1)),
                                      constraints: const BoxConstraints(
                                          maxWidth: 150,
                                          minWidth: 50,
                                          minHeight: 20),
                                      child: Text(""),
                                    )
                                  ]))
                        ]))
              ]));
        },
      ),
    );

    return pdf.save();
  }
}
