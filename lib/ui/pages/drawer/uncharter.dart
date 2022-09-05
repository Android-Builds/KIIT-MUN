import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mun/models/notification.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UNCharter extends StatefulWidget {
  const UNCharter({Key? key}) : super(key: key);

  @override
  State<UNCharter> createState() => _UNCharterState();
}

//  PdfViewerController pdfViewerController;
List<int>? documentBytes;

class _UNCharterState extends State<UNCharter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                if (documentBytes != null) {
                  final Directory? directory =
                      await getExternalStorageDirectory();

                  final File file = File(directory!.path + '/downloaded.pdf');
                  await file.writeAsBytes(documentBytes!, flush: true);

                  OpenFile.open(directory.path + '/downloaded.pdf');
                }
              },
              icon: const Icon(Icons.download))
        ],
      ),
      body: SfPdfViewer.asset(
        "assets/unchaeter.pdf",

        canShowScrollHead: true,
        canShowScrollStatus: true,
        enableTextSelection: false,
        // controller: pdfViewerController,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (detials) {
          documentBytes = detials.document.save();
        },
        pageLayoutMode: PdfPageLayoutMode.continuous,
        scrollDirection: PdfScrollDirection.vertical,
      ),
    );
  }
}
