import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MyPdfView extends StatefulWidget {
  const MyPdfView({super.key});

  @override
  State<MyPdfView> createState() => _MyPdfViewState();
}

class _MyPdfViewState extends State<MyPdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }
  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.Text("title"),
              pw.SizedBox(height: 10),
              pw.FlutterLogo(),
              pw.SizedBox(height: 50,child: pw.Image(netImage)),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}


