import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreviwe extends StatelessWidget {
  const PdfPreviwe(
      {super.key,
      required this.sudentName,
      required this.std,
      required this.section,
      required this.parentName,
      required this.phoneNumber,
      required this.addres,
      required this.totalFees,
      required this.amound});
  final String sudentName;
  final String std;
  final String section;
  final String parentName;
  final String phoneNumber;
  final String addres;
  final double totalFees;
  final double amound;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("INVOICE")),
      body: PdfPreview(
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
        build: (format) => _generatePdf(format,
            sudentName: sudentName,
            std: std,
            section: section,
            parentName: parentName,
            phoneNumber: phoneNumber,
            addres: addres,
            totalFees: totalFees,
            amound: amound),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
    PdfPageFormat format, {
    required String sudentName,
    required String std,
    required String section,
    required String parentName,
    required String phoneNumber,
    required String addres,
    required double totalFees,
    required double? amound,
  }) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    const tableHeaders = [
      'No',
      'Description',
      'Total Fees',
      'Amount',
      'Balance '
    ];

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.letter,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 20),
              pw.SizedBox(
                  width: double.infinity,
                  child: pw.Center(
                    child: pw.Text('INVOICE',
                        style: pw.TextStyle(
                            fontSize: 30, fontWeight: pw.FontWeight.bold)),
                  )),
              pw.SizedBox(height: 20),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.SizedBox(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('BILLING TO',
                            style: pw.TextStyle(
                                fontSize: 18, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 10),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4.0),
                          child: pw.Text('Sudent Name: $sudentName',
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.normal)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4.0),
                          child: pw.Text('standard: $std',
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.normal)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4.0),
                          child: pw.Text('Section: $section',
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.normal)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4.0),
                          child: pw.Text('Address: $addres',
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisSize: pw.MainAxisSize.min,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 0),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4.0),
                          child: pw.Text('Parent Name: $parentName',
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.normal)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4.0),
                          child: pw.Text('Phone Number: $phoneNumber',
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.TableHelper.fromTextArray(
                  border: null,
                  cellAlignment: pw.Alignment.centerLeft,
                  headerDecoration: const pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                    color: PdfColors.green300,
                  ),
                  headerHeight: 25,
                  cellHeight: 40,
                  cellAlignments: {
                    0: pw.Alignment.centerLeft,
                    1: pw.Alignment.centerLeft,
                    2: pw.Alignment.centerRight,
                    3: pw.Alignment.center,
                    4: pw.Alignment.centerRight,
                  },
                  headerStyle: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  cellStyle: const pw.TextStyle(
                    fontSize: 10,
                  ),
                  rowDecoration: const pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(
                        width: .5,
                      ),
                    ),
                  ),
                  headers: List<String>.generate(
                    tableHeaders.length,
                    (col) => tableHeaders[col],
                  ),
                  data: [
                    [
                      1,
                      'School Fees',
                      totalFees,
                      amound ?? 0,
                      totalFees - (amound ?? 0)
                    ]
                  ]),
              pw.SizedBox(height: 20),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4.0),
                        child: pw.Text('National Vidyalaya CBSE School',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.normal)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4.0),
                        child: pw.Text('Pudukkottai, Tamil Nadu',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.normal)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4.0),
                        child: pw.Text('principal: Dr. Emily Johnson',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.normal)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4.0),
                        child: pw.Text('Pincode 622001',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.normal)),
                      ),
                    ])
              ])
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
