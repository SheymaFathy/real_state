import 'package:go_router/go_router.dart';
import 'package:real_state/features/auth/login/pre/view/login_screen.dart';
import 'package:real_state/features/auth/profile/pre/view/profile_page.dart';
import 'package:real_state/features/auth/register/pre/view/register.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/home_page.dart';
import 'package:real_state/features/main_screen/pages/my_fav/pre/view/my_favorite.dart';
import 'package:real_state/features/splash/pre/view/splash_screen.dart';

import '../../features/main_screen/pre/view/main_screen.dart';

abstract class AppRoutes {
  static const String mainScreen = '/main_screen';
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String myFavorite = '/my_favorite';
  static const String profile = '/profile';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: splash,
          builder: (context, state) => const SplashScreen()),

      GoRoute(
        path: mainScreen,
        builder: (context, state) => const MainScreen(),
      ),

      GoRoute(
        path: login,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: register,
        builder: (context, state) =>  Register(),
      ),

      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        path: myFavorite,
        builder: (context, state) => const MyFavorite(),
      ),

      GoRoute(
        path: profile,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}
