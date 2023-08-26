import 'package:flutter/material.dart';

import '../../configuration/styles/text_styles.dart';

PreferredSizeWidget buildPreferredSizeWidget(
  String title,
) =>
    AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.person_2,
          color: Colors.black,
        ),
      ),
      title: Text(title, style: TextStyles.customStyle.bold),
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
