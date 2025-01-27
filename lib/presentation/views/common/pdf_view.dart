import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:sklad/assets/colors/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const PDF().cachedFromUrl(
        'https://wms-api.ngmkfond.uz/api/v1/documents/get-pdf/${widget.id}',
        placeholder: (progress) => Center(
          child: Text(
            '$progress %',
            style: const TextStyle(color: dark),
          ),
        ),
        errorWidget: (error) => Center(
          child: Text(
            error.toString(),
            style: const TextStyle(color: dark),
          ),
        ),
      ),
    );
  }
}
