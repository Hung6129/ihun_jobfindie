import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../configuration/styles/palettes.dart';
import '../../configuration/styles/text_styles.dart';

class MenuItems {
  static const home = DrawerThings("Home", MaterialIcons.work);
  static const chat = DrawerThings("Chat", Entypo.message);
  static const bookmarks = DrawerThings("Bookmarks", Ionicons.bookmarks);
  static const search = DrawerThings("Search", Ionicons.search_circle);
  static const profile =
      DrawerThings("Profile", MaterialCommunityIcons.tag_heart);

  static final listItems = <DrawerThings>[
    home,
    chat,
    search,
    profile,
  ];
}

class MenuPage extends StatelessWidget {
  final DrawerThings currentItem;
  final ValueChanged<DrawerThings> onSelectedItem;

  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildMenuItem(DrawerThings item) => ListTile(
          minLeadingWidth: 20,
          selectedColor: Palettes.textWhite,
          selectedTileColor: Palettes.textWhite.withOpacity(0.5),
          selected: currentItem == item,
          leading: Icon(
            item.icon,
            color: Palettes.textWhite,
          ),
          title: Text(item.title,
              style: TextStyles.defaultStyle.setColor(Palettes.textWhite)),
          onTap: () {
            onSelectedItem(item);
          },
        );

    return Scaffold(
      backgroundColor: Palettes.textBlack,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () {
                ZoomDrawer.of(context)!.close();
              },
              child: const Icon(Icons.close),
            ),
            SizedBox(height: 120.h),
            ...MenuItems.listItems.map(buildMenuItem).toList(),
            const Divider(
              thickness: 1,
              indent: 5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 20.w),
        child: Text(
          "Version 1.0.0",
          style: TextStyles.customStyle.whiteText,
        ),
      ),
    );
  }
}

class DrawerThings {
  final String title;
  final IconData icon;

  const DrawerThings(this.title, this.icon);
}
