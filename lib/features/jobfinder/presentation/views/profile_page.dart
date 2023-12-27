import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/features/jobfinder/presentation/controller/jobfinder_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: JobFinderController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            actions: [
              IconButton(
                onPressed: () {
                  controller.signOut();
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: Obx(
            () => ListTile(
              title: Text(controller.profileModel.value?.username ?? '- -'),
              subtitle: Text(controller.profileModel.value?.email ?? '- -'),
            ),
          )),
    );
  }
}
