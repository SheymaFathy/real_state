import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';
import 'package:real_state/core/theme/theme_status.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/theme/theme_cubit.dart';
import '../../../../../../core/app_localization/language_cubit.dart';
import 'label_box.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final loc = context.loc;
    final String? username = CacheHelper.getSaveData(key: 'username') as String?;
    final String? email = CacheHelper.getSaveData(key: 'email') as String?;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return SizedBox(
          height: 700.h,
          child: Stack(
            children: [
              Container(
                height: 218.h,
                decoration: BoxDecoration(color: AppColors.primary(context)),
                padding: const EdgeInsets.all(16),
              ),
              Positioned(
                top: 120.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 500.h,
                  decoration: BoxDecoration(
                    color: AppColors.backGround(context),
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
                            style: AppTextStyles.headline(context)
                          ),
                        ),
                        SizedBox(height: 16),
                        LabeledBox(
                          label: loc.translate("user_name"),
                          value: username ?? "N/A",
                          icon: Icons.person,
                        ),
                        SizedBox(height: 16),
                        ExpansionTile(
                          title: Text(
                            loc.translate("settings"),
                            style: AppTextStyles.title(context),
                          ),
                          children: [
                            // Language Switch
                            ListTile(
                              leading: const Icon(Icons.translate),
                              title: Text(
                                loc.translate('change_language'),
                                style: AppTextStyles.body(context),
                              ),
                              trailing: Container(
                                height: 36.h,
                                width: 150.w,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primary(context),
                                      AppColors.toggleBtn(context),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    final currentLang = locale.languageCode;
                                    final newLang = currentLang == 'en' ? 'ar' : 'en';
                                    context.read<LanguageCubit>().changeLanguage(newLang);
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
                                          color: AppColors.primary(context),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        locale.languageCode == 'en' ? 'English' : 'العربية',
                                        style: AppTextStyles.title(context).copyWith(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Theme Switch
                            ListTile(
                              leading: const Icon(Icons.dark_mode_outlined),
                              title: Text(
                                loc.translate('theme'),
                                style: AppTextStyles.body(context),
                              ),
                              trailing: Container(
                                height: 36.h,
                                width: 150.w,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primary(context),
                                      AppColors.toggleBtn(context),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<ThemeCubit>().toggleTheme();
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
                                          color: AppColors.primary(context),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        themeState.themeMode == ThemeMode.dark
                                            ? loc.translate("dark_theme")
                                            : loc.translate("light_theme"),
                                        style: AppTextStyles.title(context).copyWith(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Client info
                        ExpansionTile(
                          title: Text(
                            loc.translate("client_info"),
                            style: AppTextStyles.title(context),
                          ),
                          children: [
                            LabeledBox(
                              label: loc.translate("email"),
                              value: email ?? "N/A",
                              icon: Icons.email,
                            ),
                            // const UserTypeSelector(),
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
      },
    );
  }
}
