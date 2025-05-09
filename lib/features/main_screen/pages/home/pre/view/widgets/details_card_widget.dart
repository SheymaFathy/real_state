import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/web_page_view.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../data/model/unit_model.dart';

class AdsDetailsCard extends StatelessWidget {
  final UnitModel unit;

  const AdsDetailsCard({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.8,
      child: Stack(
        children: [
          Card(
            color: AppColors.backGround(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child:
                      unit.imageUrl.isNotEmpty
                          ? Image.network(
                            unit.imageUrl,
                            height: screenHeight * 0.18,
                            width: screenWidth * 1.0,
                            fit: BoxFit.cover,
                          )
                          : Container(
                            height: screenHeight * 0.18,
                            width: screenWidth * 0.8,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image_not_supported),
                          ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    unit.type,
                    style: AppTextStyles.title(
                      context,
                    ).copyWith(fontSize: 8.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "${unit.price} EGP",
                    style: AppTextStyles.title(
                      context,
                    ).copyWith(fontSize: 17.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.backGround(context),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          unit.address,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.title(
                            context,
                          ).copyWith(fontSize: 8.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.king_bed_outlined,
                        size: 20,
                        color: AppColors.titleColor(context),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${unit.numOfRooms},",
                        style: AppTextStyles.title(
                          context,
                        ).copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.bathtub_outlined,
                        size: 16,
                        color: AppColors.titleColor(context),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${unit.numOfBathrooms}",
                        style: AppTextStyles.title(
                          context,
                        ).copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.maps_home_work_outlined,
                        size: 16,
                        color: AppColors.backGround(context),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${unit.unitArea} m²",
                        style: AppTextStyles.title(
                          context,
                        ).copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButtonDef(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WebViewPage(url: unit.resourceLink),
                        ),
                      );
                    },
                    text: 'URL',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backGround(context),
                    boxShadow: [
                      BoxShadow(color: AppColors.black(context), blurRadius: 4),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
