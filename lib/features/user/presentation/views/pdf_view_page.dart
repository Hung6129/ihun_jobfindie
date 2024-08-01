import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewPage extends StatefulWidget {
  const PDFViewPage({
    super.key,
    required this.path,
    required this.fileName,
  });

  final String path;
  final String fileName;

  @override
  State<PDFViewPage> createState() => _PDFViewPageState();
}

class _PDFViewPageState extends State<PDFViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.fileName),
      ),
      body: SfPdfViewer.network(
        widget.path,
      ),
    );
  }
}
