import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/colors.dart';
import '../../view_model/navigation_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      backgroundColor: Colors.transparent,
      color: AppColors.primaryColor,
      buttonBackgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 300),
      height: 60.h,
      onTap: (index) => context.read<NavCubit>().updateIndex(index),
      items: [
        _buildNavItem(Icons.favorite_border, 0),
        _buildNavItem(Icons.home, 1),
        _buildNavItem(Icons.person_2_outlined, 2),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.primaryColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 30.sp,
        color: currentIndex == index ? AppColors.white : AppColors.white,
      ),
    );
  }

}
