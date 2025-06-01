// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/web_page_view.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../../../../widgets/title_text.dart';
import '../../../data/model/unit_model.dart';

class AdsDetailsCard extends StatelessWidget {
  final UnitModel unit;

  const AdsDetailsCard({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final loc = context.loc;

    return SingleChildScrollView(
      child: Card(
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
                      ? CarouselSlider(
                        options: CarouselOptions(
                          height: screenHeight * 0.25,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: false,
                          autoPlay: true,
                        ),
                        items:
                            unit.imageUrl.map((url) {
                              return Image.network(
                                url,
                                width: screenWidth,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) => Container(
                                      color: Colors.grey.shade300,
                                      child: const Icon(Icons.broken_image),
                                    ),
                              );
                            }).toList(),
                      )
                      : Container(
                        height: screenHeight * 0.25,
                        width: screenWidth,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_not_supported),
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                unit.type,
                style: AppTextStyles.title(context).copyWith(fontSize: 8.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "${unit.price} EGP",
                style: AppTextStyles.title(context).copyWith(fontSize: 17.sp),
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
              child: TitleText(title: loc.translate("description")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: screenHeight * 0.25,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    unit.description ?? 'No Description available',
                    style: AppTextStyles.body(
                      context,
                    ).copyWith(overflow: TextOverflow.fade),
                  ),
                ),
              ),
            ),

            if (unit.developerPortfolio != null &&
                unit.developerPortfolio!.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButtonDef(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                WebViewPage(url: unit.developerPortfolio!),
                      ),
                    );
                  },
                  text: loc.translate("portfolio"),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButtonDef(
                press: () {
                  if (unit.resourceLink.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => WebViewPage(url: unit.resourceLink),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("No URL available")),
                    );
                  }
                },
                text: loc.translate("url"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
