import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

PreferredSizeWidget buildPreferredSizeWidget() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
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
