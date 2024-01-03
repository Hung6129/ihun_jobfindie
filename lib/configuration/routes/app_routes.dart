import 'package:get/get.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/views/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/views/signup/sign_up_page.dart';
import 'package:ihun_jobfindie/features/candidate/presentation/views/profile_page.dart';
import 'package:ihun_jobfindie/features/jobs/presentation/views/job_detail_page.dart';
import 'package:ihun_jobfindie/features/main/home/home_trending_viewall_page.dart';
import 'package:ihun_jobfindie/features/main/main_page.dart';
import 'package:ihun_jobfindie/features/walk_through/walk_through_page.dart';

import 'package:ihun_jobfindie/features/welcome/welcome_page.dart';

class AppRoutes {
  static const String init = '/';
  static const String wellcome = '/welcome';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String jobDetail = '/job-detail';
  static const String profile = '/profile';
  static const String jobTrendingViewAll = '/job-trending-view-all';

  static final routes = [
    GetPage(
      name: AppRoutes.init,
      page: () => const WalkThroughPage(),
    ),
    GetPage(
      name: AppRoutes.wellcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const MainPage(),
    ),
    GetPage(
      name: AppRoutes.jobDetail,
      page: () => const JobDetailPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: AppRoutes.jobTrendingViewAll,
      page: () => const JobTrendingViewAllPage(),
    ),
  ];
}
