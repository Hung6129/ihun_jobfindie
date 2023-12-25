import 'package:get/get.dart';
import 'package:ihun_jobfindie/features/main/home/home_page.dart';
import 'package:ihun_jobfindie/features/profile/profile_page.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  var listScreens = [
    // WalkThroughPage(),
    // WelcomePage(),
    // SignInPage(),
    // SignUpPage(),
    HomePage(),
    ProfilePage(),
    // JobDetailPage(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
