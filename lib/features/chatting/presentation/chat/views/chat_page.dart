import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPreferredSizeWidget(context),
      body: Center(
        child: Text('Chat Page'),
      ),
    );
  }
}
