import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';

import 'package:ihun_jobfindie/features/walk_through/walk_through_controller.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_widget.dart';

class WalkThroughPage extends StatelessWidget {
  const WalkThroughPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalkThroughController>(
      init: WalkThroughController(),
      builder: (controller) {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Splash Page'),
                verticalMargin32,
                AppLoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
