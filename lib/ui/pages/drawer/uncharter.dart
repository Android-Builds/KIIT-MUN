import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UNCharter extends StatefulWidget {
  const UNCharter({Key? key}) : super(key: key);

  @override
  State<UNCharter> createState() => _UNCharterState();
}
//  PdfViewerController pdfViewerController;

class _UNCharterState extends State<UNCharter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.asset(
        "assets/unchaeter.pdf",

        canShowScrollHead: true,
        canShowScrollStatus: true,
        enableTextSelection: false,
        // controller: pdfViewerController,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (detials) {
          setState(() {});
        },
        pageLayoutMode: PdfPageLayoutMode.continuous,
        scrollDirection: PdfScrollDirection.vertical,
      ),
    );
  }
}
