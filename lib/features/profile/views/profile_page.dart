import 'package:flutter/material.dart';

import '../../../core/widgets/app_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPreferredSizeWidget(context),
      body: Column(
        children: [
          
        ],
      )
    );
  }
}
