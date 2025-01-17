import 'package:flutter/material.dart';
import 'package:sklad/assets/icons.dart';

class PdfInfoView extends StatefulWidget {
  const PdfInfoView({super.key});

  @override
  State<PdfInfoView> createState() => _PdfInfoViewState();
}

class _PdfInfoViewState extends State<PdfInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("№ 04-04-01/463"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: AppIcons.share.svg(),
          ),
        ],
      ),
    );
  }
}
