import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/colors.dart';
import 'package:real_state/features/main_screen/pages/home/data/repo/home_repo.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view_model/home_cubit.dart';
import 'core/app_localization/app_localization.dart';
import 'core/app_localization/language_cubit.dart';
import 'core/app_localization/language_state.dart';
import 'core/helper/routes.dart';
import 'core/shared_preferences/cach_helper.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/theme_status.dart';
import 'features/auth/login/pre/view/login_screen.dart';
import 'features/auth/profile/pre/view/profile_page.dart';
import 'features/main_screen/pages/home/pre/view/home_page.dart';
import 'features/main_screen/pages/my_fav/pre/view/my_favorite.dart';
import 'features/main_screen/pre/view/main_screen.dart';
import 'features/property_details/pre/view/prperty_details.dart';
import 'features/splash/pre/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<UnitCubit>(create: (_) => UnitCubit(HomeRepository())),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, languageState) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    locale: languageState.locale,
                    supportedLocales: const [Locale('en'), Locale('ar')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    themeMode: themeState.themeMode,
                    theme: ThemeData.light().copyWith(
                      scaffoldBackgroundColor: AppColors.white,
                    ),
                    darkTheme: ThemeData.dark().copyWith(
                      scaffoldBackgroundColor: AppColors.darkPrimary,
                    ),
                    initialRoute: AppRoutes.mainScreen ,
                    routes: {
                      AppRoutes.mainScreen: (context) => MainScreen(),
                      AppRoutes.splash: (context) => const SplashScreen(),
                      AppRoutes.login: (context) => LoginScreen(),
                      AppRoutes.home: (context) => HomePage(),
                      AppRoutes.myFavorite: (context) => const MyFavorite(),
                      AppRoutes.profile: (context) => const ProfilePage(),
                      AppRoutes.propertyDetails:(context) => const PropertyDetails(),
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
