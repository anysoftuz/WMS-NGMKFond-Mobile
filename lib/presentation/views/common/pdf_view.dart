import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
  final String title;
  final String id;
  const PDFViewerPage({
    super.key,
    required this.title,
    required this.id,
  });

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SfPdfViewer.network(
        "https://wms-api.ngmkfond.uz/api/v1/documents/get-pdf/${widget.id}",
        key: _pdfViewerKey,
      ),
    );
  }
}
