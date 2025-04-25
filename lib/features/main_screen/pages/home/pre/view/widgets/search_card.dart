import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/widgets/elevated_button_def.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/theme/theme_cubit.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  String selectedFilter = "Select Filter"; // Default text for filter
  String selectedSort = "Select Sort"; // Default text for sort
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isDark = context.read<ThemeCubit>().state == ThemeMode.dark;
    return Container(
      width: 344.w,
      height: 260.h,
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightGrey, width: 1),
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
                child: Text(
                  "Location",
                  style: AppFonts.body(locale, isDark: isDark),
                ),
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
              fillColor: AppColors.lightGrey,
              filled: true,
              hintStyle: AppFonts.body(
                locale,
                isDark: isDark,
              ).copyWith(color: AppColors.darkGrey),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border(
                    right: BorderSide(color: AppColors.darkGrey, width: 1),
                    bottom: BorderSide(color: AppColors.darkGrey, width: 1),
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
                      Icon(Icons.swap_vert, color: AppColors.darkPrimary),
                      const SizedBox(width: 8),
                      Text(
                        "Sort",
                        style: AppFonts.body(
                          locale,
                          isDark: isDark,
                        ).copyWith(color: AppColors.darkText, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height:
                    40.h, // تأكد من أن ارتفاع الخط يتطابق مع ارتفاع الكونتينرات
                width: 1, // تحديد سمك الخط
                color: AppColors.darkGrey, // تخصيص اللون
              ),
              Container(
                width: 116.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border(
                    right: BorderSide(color: AppColors.darkGrey, width: 1),
                    bottom: BorderSide(color: AppColors.darkGrey, width: 1),
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
                      Icon(Icons.sort, color: AppColors.darkPrimary),
                      const SizedBox(width: 8),
                      Text(
                        "Filter",
                        style: AppFonts.body(
                          locale,
                          isDark: isDark,
                        ).copyWith(color: AppColors.darkText, fontSize: 12.sp),
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

  // // Filter Dialog
  // void _showFilterDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("Filter Options"),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: [
  //               ListTile(
  //                 title: const Text("Location"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedFilter = "Location";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               ListTile(
  //                 title: const Text("Price Range"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedFilter = "Price Range";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               ListTile(
  //                 title: const Text("Property Type"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedFilter = "Property Type";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               ListTile(
  //                 title: const Text("Clear Filter"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedFilter = "Select Filter";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  // // Sort Dialog
  // void _showSortDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("Sort Options"),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: [
  //               ListTile(
  //                 title: const Text("Price: Low to High"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedSort = "Price: Low to High";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               ListTile(
  //                 title: const Text("Price: High to Low"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedSort = "Price: High to Low";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               ListTile(
  //                 title: const Text("Rating: High to Low"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedSort = "Rating: High to Low";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               ListTile(
  //                 title: const Text("Clear Sort"),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedSort = "Select Sort";
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
