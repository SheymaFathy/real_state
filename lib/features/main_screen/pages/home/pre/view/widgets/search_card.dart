// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/styles.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../widgets/elevated_button_def.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  String selectedFilter = "Select Filter";
  String selectedSort = "Select Sort";
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.w,
      height: 260.h,
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      decoration: BoxDecoration(
        color: AppColors.backGround(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.backGround(context), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text("Location", style: AppTextStyles.body(context)),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          TextField(
            controller: locationController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              hintText: "Dokki, Giza",
              fillColor: AppColors.textFieldColor(context),
              filled: true,
              hintStyle: AppTextStyles.body(
                context,
              ).copyWith(color: AppColors.textHintColor(context)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Divider(),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 116.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.backGround(context),
                  borderRadius: BorderRadius.circular(14),
                  border: Border(
                    right: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.swap_vert, color: AppColors.primary(context)),
                      const SizedBox(width: 8),
                      Text(
                        "Sort",
                        style: AppTextStyles.body(context).copyWith(
                          color: AppColors.titleColor(context),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height:
                    40.h, 
                width: 1, 
                color: AppColors.titleColor(context),
              ),
              Container(
                width: 116.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.backGround(context),
                  borderRadius: BorderRadius.circular(14),
                  border: Border(
                    right: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sort, color: AppColors.primary(context)),
                      const SizedBox(width: 8),
                      Text(
                        "Filter",
                        style: AppTextStyles.body(context).copyWith(
                          color: AppColors.titleColor(context),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Divider(),
          SizedBox(height: 5.h),
          ElevatedButtonDef(press: () {}, text: 'Search'),
        ],
      ),
    );
  }
}
