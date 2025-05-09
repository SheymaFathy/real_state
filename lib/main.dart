// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_localization/app_localization.dart';
import 'package:real_state/core/app_localization/language_cubit.dart';
import 'package:real_state/core/app_localization/language_state.dart';
import 'package:real_state/core/helper/routes.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';
import 'package:real_state/core/theme/theme.dart';
import 'package:real_state/core/theme/theme_cubit.dart';
import 'package:real_state/core/theme/theme_status.dart';
import 'package:real_state/features/main_screen/pages/home/data/repo/home_repo.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view_model/home_cubit.dart';

import 'features/main_screen/pages/comments/data/repo/comments_repo.dart';
import 'features/main_screen/pages/comments/pre/view_model/comments_cubit.dart';
import 'features/onboarding/pre/view_model/onboarding_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  // ✅ استخدام لغة النظام
  final Locale systemLocale = PlatformDispatcher.instance.locale;

  runApp(MyApp(systemLocale: systemLocale));
}

class MyApp extends StatelessWidget {
  final Locale systemLocale;
  const MyApp({super.key, required this.systemLocale});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit(systemLocale)),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<UnitCubit>(create: (_) => UnitCubit(UnitRepository())),
        BlocProvider<OnboardingCubit>(create: (_) => OnboardingCubit()),
        BlocProvider<CommentCubit>( create: (_) => CommentCubit(
    commentRepository: CommentRepository(),)
    ),
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
                  return MaterialApp.router(
                    routerConfig: AppRoutes.router,
                    debugShowCheckedModeBanner: false,
                    locale: languageState.locale,
                    supportedLocales: const [Locale('en'), Locale('ar')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    theme: lightTheme(context),
                    darkTheme: darkTheme(context),
                    themeMode: ThemeMode.system,
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
