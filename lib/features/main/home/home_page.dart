import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: Badge(
              child: Icon(FontAwesome.bell),
            ),
          ),
          horizontalMargin24
        ],
        leading: GestureDetector(
          onTap: () {
            Get.toNamed('/profile');
          },
          child: Icon(
            FontAwesome.user,
          ),
        ),
        title: Text('Home'),
      ),
    );
  }
}
