import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/presentation/widgets/w_button.dart';

class PDFViewerPage extends StatefulWidget {
  final String title;
  final String id;
  const PDFViewerPage({
    super.key,
    required this.title,
    required this.id,
    this.onCancel,
    this.onSucces,
  });

  final VoidCallback? onCancel;
  final VoidCallback? onSucces;

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: whiteGrey,
      ),
      backgroundColor: whiteGrey,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 16,
            children: [
              if (widget.onCancel != null)
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    color: red,
                    text: 'Отклонить',
                  ),
                ),
              if (widget.onSucces != null)
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    color: green,
                    text: 'Принять',
                  ),
                ),
            ],
          ),
        ),
      ),
      body: const PDF(backgroundColor: whiteGrey).cachedFromUrl(
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
