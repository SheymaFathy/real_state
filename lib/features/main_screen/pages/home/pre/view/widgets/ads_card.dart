// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/routes.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../data/model/unit_model.dart';
import '../../../data/repo/home_repo.dart';

class AdsCard extends StatefulWidget {
  final UnitModel unit;

  const AdsCard({super.key, required this.unit});

  @override
  State<AdsCard> createState() => _AdsCardState();
}

class _AdsCardState extends State<AdsCard> {
  bool isFavorite = false;

  void toggleFavorite() async {
    try {
      if (!isFavorite) {
        await UnitRepository().addToFavorite(widget.unit.id);
        setState(() => isFavorite = true);
      } else {
        await UnitRepository().removeFromFavorite(widget.unit.id);
        setState(() => isFavorite = false);
      }
    } catch (e) {
      print("خطأ في تعديل المفضلة: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      widget.unit.imageUrl.isNotEmpty
                          ? Image.network(
                            widget.unit.imageUrl,
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
                    widget.unit.type,
                    style: AppTextStyles.title(
                      context,
                    ).copyWith(fontSize: 8.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "${widget.unit.price} EGP",
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
                          widget.unit.address,
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
                        "${widget.unit.numOfRooms},",
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
                        "${widget.unit.numOfBathrooms}",
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
                        "${widget.unit.unitArea} m²",
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
                      context.go(
                        AppRoutes.unitDetails.replaceFirst(
                          ':id',
                          widget.unit.id.toString(),
                        ),
                      );
                    },
                    text: 'Learn More',
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
                onTap: toggleFavorite,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backGround(context),
                    boxShadow: [
                      BoxShadow(color: AppColors.black(context), blurRadius: 4),
                    ],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
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
