import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdf extends StatefulWidget {
  final String? url;
  final String? name;

  const ViewPdf({
    Key? key,
    required this.url,
    required this.name,
  }) : super(key: key);

  @override
  State<ViewPdf> createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  late PdfViewerController pdfViewerController;
  bool show = false;
  int lastPage = 1;
  int thisPage = 1;
  late TextEditingController textEditingController;

  Future<void> showPageNumberInputDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Go To Page'),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter Page Number',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                textEditingController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                if (textEditingController.text == '')
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Enter a page number to jump to page'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                if (textEditingController.text != '') {
                  int page = int.parse(textEditingController.text);
                  if (page <= pdfViewerController.pageCount)
                    pdfViewerController.jumpToPage(page);
                  else
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter a valid page number'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                }
                textEditingController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void initState() {
    pdfViewerController = PdfViewerController();
    textEditingController = TextEditingController();
    pdfViewerController.addListener(({property}) {
      if (property == 'pageChanged') {
        thisPage = pdfViewerController.pageNumber;
        if (thisPage != lastPage) {
          if (thisPage > 1 && !show) {
            setState(() {
              show = true;
            });
          } else if (thisPage == 1 && show) {
            setState(() {
              show = false;
            });
          }
          lastPage = thisPage;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '${pdfViewerController.pageNumber}/${pdfViewerController.pageCount}',
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SfPdfViewer.network(
            widget.url!,
            canShowScrollHead: true,
            canShowScrollStatus: true,
            enableTextSelection: false,
            controller: pdfViewerController,
            interactionMode: PdfInteractionMode.pan,
            onDocumentLoaded: (detials) {
              setState(() {});
            },
            pageLayoutMode: PdfPageLayoutMode.continuous,
            scrollDirection: PdfScrollDirection.vertical,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  show
                      ? FloatingActionButton(
                          heroTag: 'JumpToTop',
                          child: Icon(Icons.arrow_upward),
                          onPressed: () => pdfViewerController.firstPage(),
                        )
                      : SizedBox.shrink(),
                  SizedBox(width: 10.0),
                  FloatingActionButton(
                    heroTag: 'GoToPage',
                    child: Icon(Icons.pageview),
                    onPressed: () {
                      showPageNumberInputDialog();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
