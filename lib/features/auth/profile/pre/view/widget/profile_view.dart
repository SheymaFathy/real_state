import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/core/helper/context_extensions..dart';
import 'package:real_state/core/theme/theme_status.dart';
import 'package:real_state/features/auth/profile/pre/view/widget/user_type_selector.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/theme/theme_cubit.dart'; // تأكد من استيراد ThemeCubit
import '../../../../../../core/app_localization/language_cubit.dart'; // التأكد من استيراد LanguageCubit
import 'label_box.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final loc = context.loc;
    final isDark = context.read<ThemeCubit>().state.themeMode == ThemeMode.dark;

    return SizedBox(
      height: 700.h,
      child: Stack(
        children: [
          Container(
            height: 218.h,
            decoration: BoxDecoration(color: AppColors.primaryColor),
            padding: const EdgeInsets.all(16),
          ),
          Positioned(
            top: 120.h,
            left: 0,
            right: 0,
            child: Container(
              height: 500.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(41),
                  topRight: Radius.circular(41),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        loc.translate("hello_user"),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    LabeledBox(
                      label: loc.translate("user_name"),
                      value: "User1234",
                    ),
                    SizedBox(height: 16),
                    ExpansionTile(
                      title: Text(
                        loc.translate("settings"),
                        style: AppFonts.title(locale, isDark: isDark),
                      ),
                      children: [
                        ListTile(
                          leading: const Icon(Icons.translate),
                          title: Text(
                            loc.translate('change_language'),
                            style: AppFonts.body(locale, isDark: isDark),
                          ),
                          trailing: Container(
                            height: 36.h,
                            width: 178.w,
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.darkPrimary,
                                  AppColors.primaryColor,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                final currentLang = locale.languageCode;
                                final newLang =
                                    currentLang == 'en' ? 'ar' : 'en';
                                context.read<LanguageCubit>().changeLanguage(
                                  newLang,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    locale.languageCode == 'en'
                                        ? 'English'
                                        : 'العربية',
                                    style: AppFonts.title(
                                      locale,
                                      isDark: isDark,
                                    ).copyWith(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //theme
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, themeState) {
                            return ListTile(
                              leading: Icon(Icons.dark_mode_outlined),
                              title: Text(
                                loc.translate('theme'),
                                style: AppFonts.body(locale, isDark: isDark),
                              ),
                              trailing: Container(
                                height: 36.h,
                                width: 178.w,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.darkPrimary,
                                      AppColors.primaryColor,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<ThemeCubit>().toggleTheme(
                                      themeState.themeMode != ThemeMode.dark,
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 14,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        themeState.themeMode == ThemeMode.dark
                                            ? loc.translate("dark_theme")
                                            : loc.translate("light_theme"),
                                        style: AppFonts.title(
                                          locale,
                                          isDark: isDark,
                                        ).copyWith(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        loc.translate("client_info"),
                        style: AppFonts.title(locale, isDark: isDark),
                      ),
                      children: [
                        LabeledBox(
                          label: loc.translate("phone_number"),
                          value: "0105555555",
                        ),
                        UserTypeSelector(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
