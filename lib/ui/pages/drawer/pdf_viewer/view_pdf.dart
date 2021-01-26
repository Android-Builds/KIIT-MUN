import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class ViewPdf extends StatelessWidget {
  final String url;
  final String name;

  const ViewPdf({
    Key key,
    @required this.url,
    @required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: FutureBuilder(
          future: PDFDocument.fromURL(url),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PDFViewer(
                scrollDirection: Axis.vertical,
                document: snapshot.data,
                showPicker: false,
                zoomSteps: 2,
                navigationBuilder:
                    (context, page, totalPages, jumpToPage, animateToPage) {
                  return ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.first_page),
                        onPressed: () {
                          jumpToPage(page: 0);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.navigate_before),
                        onPressed: () {
                          animateToPage(page: page - 2);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          animateToPage(page: page);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.last_page),
                        onPressed: () {
                          jumpToPage(page: totalPages - 1);
                        },
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else
              return Center(
                child: Text('Error Fetching Data'),
              );
          },
        ));
  }
}
