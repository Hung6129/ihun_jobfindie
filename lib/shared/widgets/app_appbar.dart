import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

PreferredSizeWidget buildPreferredSizeWidget(BuildContext context) => AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.open();
        },
        icon: const Icon(
          AntDesign.menuunfold,
          color: Colors.black,
        ),
      ),
      // title: Text(title, style: TextStyles.customStyle.bold),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),
      ],
    );
