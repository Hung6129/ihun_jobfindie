import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_appbar.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPreferredSizeWidget(context),
      body: Center(
        child: Text('Bookmark Page'),
      ),
    );
  }
}
