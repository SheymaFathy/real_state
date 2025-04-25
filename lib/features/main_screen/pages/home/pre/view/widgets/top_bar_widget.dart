import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_images.dart';
import 'package:real_state/core/constants/colors.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:15.w, vertical: 10.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
             Image.asset(AppImages.topBarImg, width: 55,height:40 ,),
              Container(
                margin: EdgeInsets.only(left: 5.w, top: 15.h),
                  child: Image.asset(AppImages.topBarTextImg, width: 100, height: 14,)),
            ],
          ),
         InkWell(
            onTap: () {
              // Handle notification tap
              print("Notification tapped");
            },
           child: Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 34.h,
              width: 34.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(Icons.notifications_none, color: AppColors.darkText,),
           ),
         )
        ],
      ),
    );
  }
}
