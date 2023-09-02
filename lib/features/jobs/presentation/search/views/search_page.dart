import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/shared/widgets/app_appbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPreferredSizeWidget(context),
      body: Center(
        child: Text('Search Page'),
      ),
    );
  }
}
