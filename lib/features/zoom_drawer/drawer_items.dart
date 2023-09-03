import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/shared/services/helpers/authenticate_helper.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';

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
      backgroundColor: Palettes.p2,
      body: SafeArea(
        child: Column(
          children: [
            verticalMargin48,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
              ),
              onPressed: () {
                ZoomDrawer.of(context)!.close();
              },
              child: const Icon(
                Icons.close,
                color: Palettes.textBlack,
              ),
            ),
            SizedBox(height: 120.h),
            ...MenuItems.listItems.map(buildMenuItem).toList(),
            Divider(
              color: Palettes.textWhite,
              thickness: 0.5,
              indent: 20.w,
              endIndent: 20.w,
            ),
            ListTile(
              minLeadingWidth: 20,
              leading: const Icon(
                Icons.logout,
                color: Palettes.textWhite,
              ),
              title: Text(
                "Logout",
                style: TextStyles.defaultStyle.setColor(Palettes.textWhite),
              ),
              onTap: () async {
                await AuthenticateHelper().signOut(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 20.w),
        child: Text(
          "Version 1.0.0 by iHun",
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
