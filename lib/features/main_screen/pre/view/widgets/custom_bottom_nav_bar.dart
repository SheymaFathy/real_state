import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/context_extensions.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/helper/routes.dart';
import '../../../../../core/shared_preferences/cach_helper.dart';
import '../../../../widgets/title_text.dart';
import '../../view_model/navigation_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {

    final loc = context.loc;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return CurvedNavigationBar(
      index: currentIndex,
      backgroundColor: Colors.transparent,
      color: isDarkMode ? AppColors.primary(context) : AppColors.primary(context),
      buttonBackgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 300),
      height: 60.h,
      onTap: (index) async {
        final token = CacheHelper.getSaveData(key: 'token');

        if ((index == 0 || index == 2) && token == null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.backGround(context),
              title: TitleText(title: loc.translate("alert")),
              content: TitleText(title: loc.translate("to_show_this_page"),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: TitleText(title: loc.translate("cancel")),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    context.go(AppRoutes.login);
                  },
                  child: TitleText(title: loc.translate("login"),),
                ),
              ],
            ),
          );
        } else {
          context.read<NavCubit>().updateIndex(index);
        }
      },
      items: [
        _buildNavItem(Icons.favorite_border, 0, context),
        _buildNavItem(Icons.home, 1, context),
        _buildNavItem(Icons.person_2_outlined, 2, context),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, int index, BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: currentIndex == index
              ? (isDarkMode ? AppColors.primary(context) : AppColors.primary(context))
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 30.sp,
          color: AppColors.white(context),
        ),
      ),
    );
  }
}
