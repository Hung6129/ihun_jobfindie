import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ihun_jobfindie/features/chatting/presentation/chat/views/chat_page.dart';
import 'package:ihun_jobfindie/features/jobs/presentation/bookmark/views/bookmark_page.dart';
import 'package:ihun_jobfindie/features/jobs/presentation/home/views/home_page.dart';
import 'package:ihun_jobfindie/features/profile/views/profile_page.dart';

import '../../configuration/styles/palettes.dart';
import '../jobs/presentation/search/views/search_page.dart';
import 'drawer_items.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ZoomDrawerController z = ZoomDrawerController();
  DrawerThings currentItem = MenuItems.home;

  Widget getPages() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomePage();
      case MenuItems.search:
        return const SearchPage();
      case MenuItems.chat:
        return const ChatPage();
      case MenuItems.bookmarks:
        return const BookmarkPage();
      case MenuItems.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 30,
      disableDragGesture: true,
      mainScreenTapClose: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.sizeOf(context).width * 0.65,
      duration: const Duration(milliseconds: 500),
      angle: -5,
      drawerShadowsBackgroundColor: Palettes.p2,
      menuScreenOverlayColor: Palettes.p2,
      menuBackgroundColor: Palettes.p2,
      mainScreen: getPages(),
      menuScreen: Builder(
        builder: (context) {
          return MenuPage(
            currentItem: currentItem,
            onSelectedItem: (value) {
              setState(() {
                currentItem = value;
                ZoomDrawer.of(context)!.close();
              });
            },
          );
        },
      ),
    );
  }
}
